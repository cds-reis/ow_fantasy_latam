import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../entities/player/player.dart';
import '../../player_selection_view/available_player_modal/player_image_display.dart';

class SelectedPlayerPhoto extends ConsumerWidget {
  const SelectedPlayerPhoto({required this.player, super.key});

  final Player? player;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      borderRadius: const BorderRadius.horizontal(
        left: Radius.circular(16),
      ),
      color: Colors.black45,
      child: Builder(
        builder: (context) {
          final player = this.player;
          if (player == null) {
            return const SizedBox.expand();
          }

          final image = ref.watch(
            playerImageProvider(player).select((value) => value.valueOrNull),
          );

          return SizedBox.expand(
            child: switch (image) {
              Some(:final value) => Image.memory(value, fit: BoxFit.contain),
              None() || null => null,
            },
          );
        },
      ),
    );
  }
}
