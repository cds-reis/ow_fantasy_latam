import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/video_announcement_provider.dart';
import '../../../../widgets/video_announcement_view.dart';

class VideoAnnouncement extends ConsumerWidget {
  const VideoAnnouncement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final url = ref.watch(videoAnnouncementProvider);

    return url.when(
      data: (data) => VideoAnnouncementView(url: data),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
