import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/supabase_provider.dart';
import '../providers/user_roster/original_user_roster.dart';
import '../providers/user_roster/user_roster_exists.dart';
import '../providers/user_roster/user_roster_provider.dart';

part 'logout_provider.g.dart';

@riverpod
Future<void> logout(Ref ref) async {
  final supabase = ref.read(supabaseProvider);

  await supabase.auth.signOut();
  ref
    ..invalidate(userRosterProvider)
    ..invalidate(originalUserRosterProvider)
    ..invalidate(userRosterExistsProvider);
}
