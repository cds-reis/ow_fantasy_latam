import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/roster_deadline_provider.dart';
import '../../../../utils/format_readable_date.dart';
import 'game_week_item.dart';

class DeadlineItem extends ConsumerWidget {
  const DeadlineItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deadline = ref.watch(rosterDeadlineProvider).valueOrNull;

    return GameWeekItem(
      label: 'Deadline',
      value: deadline != null ? formatReadableDate(deadline.deadline) : '...',
    );
  }
}
