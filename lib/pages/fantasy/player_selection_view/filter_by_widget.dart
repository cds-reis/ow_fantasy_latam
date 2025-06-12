import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../entities/player_selection_filter.dart';
import '../../../providers/teams_provider.dart';

part 'filter_by_widget.g.dart';

@riverpod
class FilterBy extends _$FilterBy {
  @override
  PlayerSelectionFilter? build() {
    ref.keepAlive();
    return null;
  }

  void setFilter(PlayerSelectionFilter? filter) {
    state = filter;
  }
}

@riverpod
Future<IList<PlayerSelectionFilter>> availableFilters(Ref ref) async {
  ref
    ..keepAlive()
    ..invalidate(filterByProvider);
  final teams = await ref.watch(teamsProvider.future);

  ref.invalidate(filterByProvider);

  return IList([
    ...FilterByRole.values,
    ...teams.map((team) => FilterByTeam(team: team)),
  ]);
}

class FilterByWidget extends ConsumerWidget {
  const FilterByWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterByProvider);
    final availableFilters = ref.watch(availableFiltersProvider);

    return DropdownButtonFormField<PlayerSelectionFilter?>(
      key: ValueKey(availableFilters),
      decoration: InputDecoration(
        labelText: 'Filter',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      items: [
        const DropdownMenuItem(child: Text('All')),
        ...switch (availableFilters) {
          AsyncData(:final value) => value.map(
            (filter) => DropdownMenuItem(
              value: filter,
              child: Text(filter.label),
            ),
          ),
          _ => [],
        },
      ],
      value: filter,
      onChanged: (value) {
        ref.read(filterByProvider.notifier).setFilter(value);
      },
    );
  }
}
