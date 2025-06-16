import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../../entities/announcement/video_announcement_url.dart';
import '../../../../main.dart';
import '../../../../providers/video_announcement_provider.dart';

class VideoAnnouncement extends ConsumerWidget {
  const VideoAnnouncement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final url = ref.watch(videoAnnouncementProvider);

    return url.when(
      data: (data) => _VideoAnnouncementContent(url: data),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _VideoAnnouncementContent extends StatefulWidget {
  const _VideoAnnouncementContent({required this.url});

  final VideoAnnouncementUrl url;

  @override
  State<_VideoAnnouncementContent> createState() =>
      _VideoAnnouncementContentState();
}

class _VideoAnnouncementContentState extends State<_VideoAnnouncementContent> {
  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      _controller = VideoPlayerController.networkUrl(
        widget.url,
        viewType: VideoViewType.platformView,
        videoPlayerOptions: VideoPlayerOptions(
          allowBackgroundPlayback: true,
        ),
      );
      await _controller.initialize();
      setState(() {});
      await _controller.setVolume(0);
      await _controller.play();
      talker.info(
        'VideoPlayerController initialized',
      );
    } on Object catch (e, stackTrace) {
      talker.error(
        'Failed to initialize VideoPlayerController',
        e,
        stackTrace,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Container();
  }
}
