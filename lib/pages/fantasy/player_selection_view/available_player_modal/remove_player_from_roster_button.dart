import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../entities/player/player.dart';
import '../../../../providers/season_provider.dart';
import '../../../../providers/user_roster/user_roster_provider.dart';

class RemovePlayerFromRosterButton extends ConsumerWidget {
  const RemovePlayerFromRosterButton({required this.player, super.key});

  final Player player;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          ref
              .read(
                userRosterProvider(ref.read(selectedSeasonProvider)).notifier,
              )
              .removePlayer(player);
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          fixedSize: const Size.fromHeight(50),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
          ),
        ),
        child: const Text(
          'Remove from Roster',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}
