import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/announcement/announcement.dart';
import '../entities/announcement/announcement_language.dart';
import '../entities/announcement/announcement_path.dart';
import 'supabase_provider.dart';

part 'announcement_provider.g.dart';

@riverpod
Future<IList<AnnouncementPath>> allAnnouncements(
  Ref ref,
  AnnouncementLanguage language,
) async {
  ref.keepAlive();
  final supabase = ref.watch(supabaseProvider);
  final response = await supabase.storage
      .from('change-logs')
      .list(path: language.path);

  return response
      .map((e) => AnnouncementPath(path: e.name, language: language))
      .toIList();
}

@riverpod
Future<Announcement> announcement(Ref ref, AnnouncementPath path) {
  ref.keepAlive();

  return ref
      .watch(supabaseProvider)
      .storage
      .from('change-logs')
      .download(path.value)
      .then((bytes) => Announcement.fromBytes(bytes: bytes, path: path));
}
