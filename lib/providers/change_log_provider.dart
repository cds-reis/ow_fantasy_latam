import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/change_log/change_log.dart';
import '../entities/change_log/change_log_language.dart';
import '../entities/change_log/change_log_path.dart';
import 'supabase_provider.dart';

part 'change_log_provider.g.dart';

@riverpod
Future<IList<ChangeLogPath>> allChangeLogs(
  Ref ref,
  ChangeLogLanguage language,
) async {
  ref.keepAlive();
  final supabase = ref.watch(supabaseProvider);
  final response = await supabase.storage
      .from('change-logs')
      .list(path: language.path);

  return response
      .map((e) => ChangeLogPath(path: e.name, language: language))
      .toIList();
}

@riverpod
Future<ChangeLog> changeLog(Ref ref, ChangeLogPath path) {
  ref.keepAlive();

  return ref
      .watch(supabaseProvider)
      .storage
      .from('change-logs')
      .download(path)
      .then((bytes) => ChangeLog.fromBytes(bytes: bytes, path: path));
}
