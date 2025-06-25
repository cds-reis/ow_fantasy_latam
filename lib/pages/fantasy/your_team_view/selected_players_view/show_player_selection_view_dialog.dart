import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../entities/player/player_role.dart';
import '../../player_selection_view/player_selection_view.dart';

void showPlayerSelectionViewDialog(BuildContext context, PlayerRole role) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return Dialog.fullscreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(24),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Roster'),
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: PlayerSelectionView(),
              ),
            ),
          ],
        ),
      );
    },
  );
}
