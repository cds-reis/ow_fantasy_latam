import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../entities/match/match.dart';
import '../../../../entities/season/season.dart';
import '../../../../providers/season_provider.dart';
import '../../../../providers/supabase_provider.dart';
import '../../../../utils/hardstring.dart';
import 'next_match_item.dart';

part 'next_matches_view.g.dart';

@riverpod
Future<IList<Match>> nextMatches(Ref ref, Season season) async {
  ref.keepAlive();
  final supabase = ref.watch(supabaseProvider);
  final matches = await supabase
      .from('matches')
      .select('''
        match_time,
        first_team_score:team_a_score,
        second_team_score:team_b_score,
        weeks!inner( season_id ),
        first_team:season_teams!matches_team_a_id_fkey ( teams!inner ( id, name ) ),
        second_team:season_teams!matches_team_b_id_fkey ( teams!inner ( id, name ) ),
        player_scores: player_scores ( player_id, score ),
        is_completed
''')
      .eq('weeks.season_id', season.id.value)
      .order('match_time')
      .limit(20);

  return matches.map(MatchMapper.fromMap).toIList();
}

class NextMatchesView extends StatelessWidget {
  const NextMatchesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Matches'.hardString,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Gap(16),
        Consumer(
          builder: (context, ref, child) {
            final nextMatches = ref.watch(
              nextMatchesProvider(ref.watch(selectedSeasonProvider)),
            );

            return nextMatches.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Text(error.toString()),
              data: (matches) => Expanded(
                child: ListView.separated(
                  itemCount: matches.length,
                  itemBuilder: (context, index) {
                    return NextMatchItem(match: matches[index]);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
