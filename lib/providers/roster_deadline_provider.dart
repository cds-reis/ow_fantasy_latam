import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/roster_deadline.dart';
import 'supabase_provider.dart';

part 'roster_deadline_provider.g.dart';

@riverpod
Future<RosterDeadline> rosterDeadline(Ref ref) async {
  final supabase = ref.watch(supabaseProvider);
  final response = await supabase.functions.invoke(
    'get-roster-submition-deadline',
  );

  return RosterDeadlineMapper.fromMap(response.data as Map<String, dynamic>);
}
