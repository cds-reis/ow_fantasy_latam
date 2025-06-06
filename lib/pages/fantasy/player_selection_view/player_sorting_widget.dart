import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../entities/player_sorting.dart';

part 'player_sorting_widget.g.dart';

@riverpod
class AvailablePlayerSorting extends _$AvailablePlayerSorting {
  @override
  PlayerSorting build() => PlayerSorting.totalPoints;

  void setSorting(PlayerSorting sorting) {
    state = sorting;
  }
}

class PlayerSortingWidget extends ConsumerWidget {
  const PlayerSortingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField<PlayerSorting>(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        labelText: 'Sort By',
      ),
      value: ref.watch(availablePlayerSortingProvider),
      items: [
        for (final sorting in PlayerSorting.values)
          DropdownMenuItem(value: sorting, child: Text(sorting.title)),
      ],
      onChanged: (value) {
        ref.read(availablePlayerSortingProvider.notifier).setSorting(value!);
      },
    );
  }
}
