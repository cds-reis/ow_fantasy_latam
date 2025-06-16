import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/announcement/video_announcement_url.dart';
import 'season_provider.dart';
import 'supabase_provider.dart';

part 'video_announcement_provider.g.dart';

@riverpod
Future<VideoAnnouncementUrl> videoAnnouncement(Ref ref) async {
  ref.keepAlive();
  final season = ref.watch(selectedSeasonProvider);

  final path = '${season.id}.mp4';
  final videoBytes = ref
      .watch(supabaseProvider)
      .storage
      .from('announcement-videos')
      .getPublicUrl(path);

  return VideoAnnouncementUrl(Uri.parse(videoBytes));
}
