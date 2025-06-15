import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../supabase_provider.dart';

part 'is_user_backoffice_provider.g.dart';

@riverpod
Future<bool> isUserBackoffice(Ref ref) async {
  final supabase = ref.watch(supabaseProvider);

  return isUserBackofficeUseCase(supabase);
}

Future<bool> isUserBackofficeUseCase(SupabaseClient supabase) async {
  final response = await supabase.functions.invoke('is-user-backoffice');

  final data = response.data as Map<String, dynamic>;

  return data['is_backoffice'] as bool;
}
