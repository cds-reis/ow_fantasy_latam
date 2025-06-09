import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entities/exceptions/roster_creation_exception.dart';
import '../../../providers/season_provider.dart';
import '../../../providers/user_roster/submit_user_roster_provider.dart';
import '../../../providers/user_roster/user_roster_provider.dart';
import '../../../utils/build_context_extensions.dart';

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
              .read(userRosterProvider(ref.read(selectedSeasonProvider).id))
              .requireValue;

          if (!roster.isFull) {
            context.showErrorSnackBar(
              'Your roster is not full. Please add all players to your roster',
            );

            return;
          }

          if (roster.budget < 0) {
            context.showErrorSnackBar(
              'Your roster cost is too high.',
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
        } on RosterCreationException catch (e) {
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
