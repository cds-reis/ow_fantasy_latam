import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../entities/player/player.dart';
import '../../../../entities/player/player_role.dart';
import '../../../../entities/player_selection_filter.dart';
import '../../../../utils/build_context_extensions.dart';
import '../../../../widgets/images/player_role_icon.dart';
import '../../player_selection_view/available_player_modal/available_player_modal.dart';
import '../../player_selection_view/filter_by_widget.dart';
import 'selected_player_item_info.dart';
import 'selected_player_photo.dart';
import 'show_player_selection_view_dialog.dart';

class SelectedPlayerItem extends ConsumerWidget {
  const SelectedPlayerItem.tank({required this.player, super.key})
    : role = PlayerRole.tank;

  const SelectedPlayerItem.damage({required this.player, super.key})
    : role = PlayerRole.damage;

  const SelectedPlayerItem.support({required this.player, super.key})
    : role = PlayerRole.support;

  final PlayerRole role;
  final Player? player;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 175,
      child: Row(
        spacing: 24,
        children: [
          if (context.width > 600)
            Expanded(
              child: PlayerRoleIcon(
                role: role,
                fit: context.isMobile ? null : BoxFit.fitHeight,
              ),
            ),
          Expanded(
            flex: 8,
            child: Material(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.red.shade700,
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => onTap(ref, context),
                child: Row(
                  children: [
                    if (!context.isMobile)
                      Expanded(
                        flex: 2,
                        child: SelectedPlayerPhoto(player: player),
                      ),
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: SelectedPlayerItemInfo(player: player),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTap(WidgetRef ref, BuildContext context) {
    switch (player) {
      case null:
        ref.read(filterByProvider.notifier).setFilter(FilterByRole(role: role));
        if (context.isMobile) {
          showPlayerSelectionViewDialog(context, role);
        }
      case final Player player:
        showAvailablePlayerModal(context, player);
    }
  }
}
