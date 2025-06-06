import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../entities/player/player.dart';
import '../../../../entities/player_selection_filter.dart';
import '../../../../entities/player_sorting.dart';
import '../../../../entities/season/season.dart';
import '../../../../providers/all_players_query_provider.dart';

part 'filtered_available_players_provider.g.dart';

@riverpod
Future<IList<Player>> filteredAvailablePlayers(
  Ref ref, {
  required Season season,
  required PlayerSelectionFilter? filter,
  required PlayerSorting sorting,
  required int maxCost,
  required String searchQuery,
}) async {
  ref.keepAlive();
  var query = ref.watch(allPlayersQueryProvider);
  query = query.filter('season_id', 'eq', season.id);

  final queryFilter = _buildFilter(filter);

  if (queryFilter != null) {
    query = query.filter(queryFilter.column, 'eq', queryFilter.value);
  }

  query = query.lte('cost', maxCost);

  if (searchQuery.isNotEmpty) {
    query = query.ilike('name', '%$searchQuery%');
  }

  final querySorting = _buildSorting(sorting);
  if (querySorting != null) {
    final finalQuery = await query.order(
      querySorting.column,
      ascending: querySorting.ascending,
    );

    return finalQuery.map(PlayerMapper.fromMap).toIList();
  }

  final result = await query;

  return result.map(PlayerMapper.fromMap).toIList();
}

({String column, Object value})? _buildFilter(PlayerSelectionFilter? filter) {
  switch (filter) {
    case null:
      return null;
    case FilterByRole():
      return (column: 'role', value: filter.role.name);
    case FilterByTeam():
      throw UnimplementedError();
  }
}

({String column, bool ascending})? _buildSorting(PlayerSorting sorting) {
  switch (sorting) {
    case PlayerSorting.priceDesc:
      return (column: 'cost', ascending: false);
    case PlayerSorting.priceAsc:
      return (column: 'cost', ascending: true);
    case PlayerSorting.totalPoints:
      return (column: 'total_score', ascending: false);
    case PlayerSorting.roundPoints:
      return (column: 'latest_score', ascending: false);
    // case PlayerSorting.mostSelected:
    //   return null;
  }
}
