import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/announcement/video_announcement_url.dart';
import 'season_provider.dart';
import 'supabase_provider.dart';

part 'video_announcement_provider.g.dart';

@riverpod
class VideoAnnouncement extends _$VideoAnnouncement {
  @override
  Future<VideoAnnouncementUrl> build() async {
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

  Future<void> changeVideo(Uint8List bytes) async {
    state = const AsyncLoading();
    final seasonId = ref.read(selectedSeasonProvider).id;
    final supabase = ref.read(supabaseProvider);
    final path = '$seasonId.mp4';
    final bucket = supabase.storage.from('announcement-videos');
    await bucket.remove([path]);
    await bucket.uploadBinary(path, bytes);

    ref.invalidateSelf();
  }
}
