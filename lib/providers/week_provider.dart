import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/week/week.dart';
import 'season_provider.dart';
import 'supabase_provider.dart';

part 'week_provider.g.dart';

@riverpod
class SelectedWeek extends _$SelectedWeek {
  @override
  Week? build() {
    ref.keepAlive();
    return null;
  }

  // ignore: use_setters_to_change_properties, //
  void selectWeek(Week week) {
    state = week;
  }
}

@riverpod
Future<IList<Week>> week(Ref ref) async {
  ref.keepAlive();
  final supabase = ref.watch(supabaseProvider);
  final weeks = await supabase
      .from('weeks')
      .select('id, number:week_number')
      .eq('season_id', ref.watch(selectedSeasonProvider).id)
      .order('week_number', ascending: false);
  final iList = weeks.map(WeekMapper.fromMap).toIList();
  ref.read(selectedWeekProvider.notifier).selectWeek(iList.first);
  return iList;
}

class WeekSelector extends ConsumerWidget {
  const WeekSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedWeek = ref.watch(selectedWeekProvider);

    return ref
        .watch(weekProvider)
        .when(
          data: (weeks) => DropdownButtonFormField(
            value: selectedWeek,
            items: weeks
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
            onChanged: (week) {
              if (week != null) {
                ref.read(selectedWeekProvider.notifier).selectWeek(week);
              } else {
                ref.invalidate(weekProvider);
              }
            },
          ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
