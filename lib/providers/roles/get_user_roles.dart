import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/user/user_role.dart';
import '../supabase_provider.dart';

part 'get_user_roles.g.dart';

@riverpod
Future<IList<UserRole>> getUserRoles(Ref ref) async {
  final supabase = ref.watch(supabaseProvider);

  final response = await supabase.functions.invoke('get-user-roles');

  final data = List<Map<String, dynamic>>.from(response.data as List<dynamic>);

  return data.map(UserRoleMapper.fromMap).toIList();
}
