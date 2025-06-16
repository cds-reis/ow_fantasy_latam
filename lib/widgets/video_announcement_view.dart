import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../entities/announcement/video_announcement_url.dart';
import '../main.dart';

class VideoAnnouncementView extends StatefulWidget {
  const VideoAnnouncementView({required this.url, super.key});

  final VideoAnnouncementUrl url;

  @override
  State<VideoAnnouncementView> createState() => _VideoAnnouncementViewState();
}

class _VideoAnnouncementViewState extends State<VideoAnnouncementView> {
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
        ? DecoratedBox(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          )
        : const SizedBox.shrink();
  }
}
