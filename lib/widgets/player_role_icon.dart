import 'package:flutter/material.dart';

import '../entities/player/player_role.dart';

class PlayerRoleIcon extends StatelessWidget {
  const PlayerRoleIcon({required this.role, this.size = 100, super.key});

  final PlayerRole role;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/${role.name.toLowerCase()}.png',
      height: size,
      width: size,
      fit: BoxFit.fitHeight,
    );
  }
}
