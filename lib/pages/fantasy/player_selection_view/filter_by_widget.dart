import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../entities/player_selection_filter.dart';

part 'filter_by_widget.g.dart';

@riverpod
class FilterBy extends _$FilterBy {
  @override
  PlayerSelectionFilter? build() {
    return null;
  }

  void setFilter(PlayerSelectionFilter? filter) {
    state = filter;
  }
}

class FilterByWidget extends ConsumerWidget {
  const FilterByWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterByProvider);

    return DropdownButtonFormField<PlayerSelectionFilter?>(
      decoration: InputDecoration(
        labelText: 'Filter',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      items: [
        const DropdownMenuItem(
          child: Text('All'),
        ),
        for (final filter in FilterByRole.values)
          DropdownMenuItem(
            value: filter,
            child: Text(filter.role.title),
          ),
      ],
      value: filter,
      onChanged: (value) {
        ref.read(filterByProvider.notifier).setFilter(value);
      },
    );
  }
}
