import 'package:flutter/material.dart';

import '../../../../../entities/player/player_role.dart';

class MaximumNumberOfPlayersForRole extends StatelessWidget {
  const MaximumNumberOfPlayersForRole({required this.role, super.key});

  final PlayerRole role;

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
            child: Text(
              'Maximum number of ${switch (role) {
                PlayerRole.tank => 'Tanks',
                PlayerRole.damage => 'DPS',
                PlayerRole.support => 'Support',
              }}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
