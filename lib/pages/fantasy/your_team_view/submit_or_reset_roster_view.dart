import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entities/exceptions/no_transfers_available.dart';
import '../../../entities/roster/roster.dart';
import '../../../providers/season_provider.dart';
import '../../../providers/user_roster/submit_user_roster_provider.dart';
import '../../../providers/user_roster/user_roster_provider.dart';
import '../../../utils/build_context_extensions.dart';

class SubmitOrResetRosterView extends ConsumerWidget {
  const SubmitOrResetRosterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            const Expanded(child: SubmitButton()),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  ref
                      .read(
                        userRosterProvider(
                          ref.read(selectedSeasonProvider),
                        ).notifier,
                      )
                      .reset();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  fixedSize: const Size.fromHeight(50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
                  ),
                ),
                child: const Text(
                  'Reset Roster',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubmitButton extends ConsumerStatefulWidget {
  const SubmitButton({super.key});

  @override
  ConsumerState<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends ConsumerState<SubmitButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ElevatedButton(
      onPressed: () async {
        if (_isLoading) {
          return;
        }

        try {
          setState(() => _isLoading = true);

          final roster = ref
              .read(userRosterProvider(ref.read(selectedSeasonProvider)))
              .requireValue;

          if (!roster.isFull) {
            context.showErrorSnackBar(
              'Your roster is not full. Please add all players to your roster',
            );

            return;
          }

          if (roster.cost > Roster.maxCost) {
            context.showErrorSnackBar(
              'Your roster cost is too high. The maximum cost is ${Roster.maxCost}',
            );

            return;
          }

          if (!roster.onlyTwoOfSameTeam) {
            context.showErrorSnackBar(
              'You can only have two players from the same team',
            );

            return;
          }

          await ref.read(submitUserRosterProvider(roster).future);

          if (!context.mounted) {
            return;
          }

          context.showSuccessSnackBar('Roster submitted successfully');
        } on NoTransfersAvailableException catch (e) {
          if (!context.mounted) {
            return;
          }

          context.showErrorSnackBar(e.message);
        } on Exception catch (e, st) {
          if (!context.mounted) {
            return;
          }

          context.showErrorSnackBar(
            'Something went wrong while submitting your roster',
          );

          log(
            'Something went wrong while submitting your roster',
            error: e,
            stackTrace: st,
          );
        } finally {
          setState(() => _isLoading = false);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        fixedSize: const Size.fromHeight(50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
        ),
      ),
      child: const Text(
        'Submit Roster',
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
