import 'package:flutter/material.dart';

import '../../../../entities/player/player.dart';
import '../../../../widgets/images/player_role_icon.dart';

class PlayerNameAndRole extends StatelessWidget {
  const PlayerNameAndRole({required this.player, super.key});

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        PlayerRoleIcon(role: player.role, size: 50),
        Text(
          player.name,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
