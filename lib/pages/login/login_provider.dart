import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../entities/email.dart';
import '../../entities/password.dart';
import '../../providers/supabase_provider.dart';

@riverpod
Future<User> login(
  Ref ref, {
  required Email email,
  required Password password,
}) async {
  final response = await ref
      .watch(supabaseProvider)
      .auth
      .signInWithPassword(email: email.value, password: password.value);

  return switch (response.user) {
    final User user => user,
    null => throw AuthApiException('Failed to login'),
  };
}
