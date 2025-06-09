import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/season_provider.dart';
import '../../../providers/user_roster/user_roster_provider.dart';
import 'submit_button.dart';

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
                          ref.read(selectedSeasonProvider).id,
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
