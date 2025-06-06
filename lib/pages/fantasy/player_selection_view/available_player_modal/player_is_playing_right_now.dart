import 'package:flutter/material.dart';

import '../../../../entities/player/player.dart';

class PlayerIsPlayingRightNowButton extends StatelessWidget {
  const PlayerIsPlayingRightNowButton({required this.player, super.key});

  final Player player;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.forbidden,
      opaque: false,
      child: AbsorbPointer(
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              fixedSize: const Size.fromHeight(50),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
              ),
            ),
            child: const Text(
              'Player is playing right now',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
