import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entities/user/user_role_name.dart';
import '../../../providers/season_provider.dart';
import '../../../providers/video_announcement_provider.dart';
import '../../../widgets/page_content.dart';
import '../../../widgets/video_announcement_view.dart';
import '../role_page_mixin.dart';

class CurrentVideoAnnouncement extends ConsumerStatefulWidget {
  const CurrentVideoAnnouncement({super.key});

  static const routeName = 'current-video-announcement';
  static const routePath = '/backoffice/$routeName';

  @override
  ConsumerState<CurrentVideoAnnouncement> createState() =>
      _CurrentVideoAnnouncementState();
}

class _CurrentVideoAnnouncementState
    extends ConsumerState<CurrentVideoAnnouncement>
    with RolePageMixin {
  @override
  UserRoleName get userRoleName => UserRoleName.announcementsCreator;

  @override
  Widget build(BuildContext context) {
    final videoAnnouncement = ref.watch(videoAnnouncementProvider);
    return PageContent(
      title: 'Video Announcement',
      spacing: 16,
      children: [
        SizedBox(
          child: Row(
            spacing: 16,
            children: [
              const SizedBox(
                width: 200,
                child: SeasonSelector(),
              ),
              ElevatedButton(
                onPressed: () async {
                  final newVideo = await openFile(
                    acceptedTypeGroups: [
                      const XTypeGroup(extensions: ['mp4']),
                    ],
                  );

                  if (newVideo == null) return;

                  if (!context.mounted) {
                    return;
                  }

                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child: const Text(
                              'Confirm',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                        content: Text(
                          newVideo.name,
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      );
                    },
                  );

                  if (confirm == null || !confirm) {
                    return;
                  }

                  final bytes = await compute(
                    (video) => video.readAsBytes(),
                    newVideo,
                  );

                  await ref
                      .read(videoAnnouncementProvider.notifier)
                      .changeVideo(bytes);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'Change Video',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: SizedBox(
            height: 600,
            child: videoAnnouncement.when(
              data: (data) => VideoAnnouncementView(url: data),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
      ],
    );
  }
}
