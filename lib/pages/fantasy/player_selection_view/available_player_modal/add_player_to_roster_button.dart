import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../entities/player/player.dart';
import '../../../../providers/season_provider.dart';
import '../../../../providers/user_roster_provider.dart';

class AddPlayerToRosterButton extends ConsumerWidget {
  const AddPlayerToRosterButton({required this.player, super.key});

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
              .addPlayer(player);
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
          'Add to Roster',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}
