import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_players_widget.g.dart';

@riverpod
class SearchPlayerByNameQuery extends _$SearchPlayerByNameQuery {
  @override
  String build() {
    return '';
  }

  void update(String query) {
    state = query;
  }
}

class SearchPlayersWidget extends ConsumerWidget {
  const SearchPlayersWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      onChanged: (query) {
        ref.read(searchPlayerByNameQueryProvider.notifier).update(query);
      },
      decoration: InputDecoration(
        labelText: 'Search Players...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
