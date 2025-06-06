import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../entities/player/player.dart';
import '../../../../widgets/player_role_icon.dart';
import '../available_player_modal/available_player_modal.dart';

class AvailablePlayerItem extends ConsumerWidget {
  const AvailablePlayerItem({required this.player, super.key});

  final Player player;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.grey),
      ),
      child: InkWell(
        onTap: () {
          showAvailablePlayerModal(context, player);
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                flex: 40,
                child: Text(player.name, style: const TextStyle(fontSize: 16)),
              ),
              Expanded(
                flex: 15,
                child: Text(
                  player.cost.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: 15,
                child: Text(
                  player.totalScore.formatted,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: 15,
                child: Text(
                  player.latestScore.formatted,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: 15,
                child: PlayerRoleIcon(role: player.role, size: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AvailablePlayerItemHeader extends StatelessWidget {
  const AvailablePlayerItemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Spacer(flex: 40),
          Expanded(
            flex: 15,
            child: Text(
              'Cost',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            flex: 15,
            child: Text(
              'TP',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            flex: 15,
            child: Text(
              'LP',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            flex: 15,
            child: Text(
              'Role',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
