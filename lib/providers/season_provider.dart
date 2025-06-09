import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/season/season.dart';
import '../entities/season/season_id.dart';
import 'supabase_provider.dart';

part 'season_provider.g.dart';

@riverpod
class SelectedSeason extends _$SelectedSeason {
  @override
  Season build() => const Season(id: SeasonId(1), name: 'Season 5 Master');

  // ignore: use_setters_to_change_properties, //
  void selectSeason(Season season) {
    state = season;
  }
}

@riverpod
Future<IList<Season>> season(Ref ref) async {
  ref.keepAlive();
  final supabase = ref.watch(supabaseProvider);
  final seasons = await supabase
      .from('seasons')
      .select()
      .filter('is_active', 'eq', true);
  final iList = seasons.map(SeasonMapper.fromMap).toIList();
  ref.read(selectedSeasonProvider.notifier).selectSeason(iList.first);
  return iList;
}

class SeasonSelector extends ConsumerWidget {
  const SeasonSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSeason = ref.watch(selectedSeasonProvider);

    return ref
        .watch(seasonProvider)
        .when(
          data: (seasons) => DropdownButtonFormField(
            value: selectedSeason,
            items: seasons
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e.name,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
                .toList(),
            onChanged: (season) {
              if (season case Season()) {
                ref.read(selectedSeasonProvider.notifier).selectSeason(season);
              } else {
                ref.invalidate(seasonProvider);
              }
            },
          ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
