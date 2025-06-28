import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/match/match.dart';
import '../../entities/week/week.dart';
import '../week_provider.dart';
import 'matches_provider.dart';

part 'matches_for_week_provider.g.dart';

@riverpod
class SelectedMatch extends _$SelectedMatch {
  @override
  Match? build() {
    ref.listen(selectedWeekProvider, (_, _) => ref.invalidateSelf());
    return null;
  }

  void selectMatch(Match match) {
    state = match;
  }
}

@riverpod
Future<IList<Match>> matchesForWeek(Ref ref, WeekId weekId) async {
  ref.keepAlive();
  final matches = await ref
      .watch(matchesQueryProvider)
      .eq('week_id', weekId)
      .order('match_time');

  return matches.map(MatchMapper.fromMap).toIList();
}

class MatchSelectorForWeek extends ConsumerWidget {
  const MatchSelectorForWeek({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedWeek = ref.watch(selectedWeekProvider);
    if (selectedWeek == null) {
      return const SizedBox.shrink();
    }

    final matches = ref.watch(matchesForWeekProvider(selectedWeek.id));
    final selectedMatch = ref.watch(selectedMatchProvider);

    return matches.when(
      data: (matches) {
        return DropdownButtonFormField(
          value: selectedMatch,
          hint: const Text('Select a match'),
          items: [
            for (final match in matches)
              DropdownMenuItem(
                value: match,
                child: Text(match.formatted),
              ),
          ],
          onChanged: (match) {
            if (match != null) {
              ref.read(selectedMatchProvider.notifier).selectMatch(match);
            } else {
              ref.invalidate(selectedMatchProvider);
            }
          },
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
