import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../entities/exceptions/empty_player_image_exception.dart';
import '../../../../entities/player/player.dart';
import '../../../../entities/player/player_image.dart';
import '../../../../providers/supabase_provider.dart';

part 'player_image_display.g.dart';

@riverpod
Future<PlayerImage> playerImage(Ref ref, Player player) async {
  ref.keepAlive();
  final supabase = ref.watch(supabaseProvider);
  final bucket = supabase.storage.from('players-photo-bucket');
  final path = '${player.id}.jpg';
  final playerHasImage = await bucket.exists(path);

  if (!playerHasImage) {
    throw const EmptyPlayerImageException();
  }

  final image = await bucket.download(path);

  return PlayerImage(image);
}

class PlayerImageDisplay extends ConsumerWidget {
  const PlayerImageDisplay({required this.player, super.key});

  final Player player;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(playerImageProvider(player));

    return switch (image) {
      AsyncLoading() => const SizedBox.square(
        dimension: 300,
        child: Center(child: CircularProgressIndicator()),
      ),
      AsyncData(:final value) => Image.memory(value),
      AsyncError(error: const EmptyPlayerImageException()) =>
        const SizedBox.square(
          dimension: 300,
          child: Center(child: Placeholder()),
        ),
      AsyncError(:final error) => Text(error.toString()),
      _ => throw UnsupportedError('Unreachable'),
    };
  }
}
