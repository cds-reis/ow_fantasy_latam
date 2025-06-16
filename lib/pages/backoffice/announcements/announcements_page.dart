import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';

import '../../../entities/announcement/announcement_language.dart';
import '../../../entities/announcement/announcement_path.dart';
import '../../../entities/user/user_role_name.dart';
import '../../../providers/announcement_provider.dart';
import '../../../widgets/page_content.dart';
import '../role_page_mixin.dart';
import 'announcement_selection_item.dart';

class AnnouncementsPage extends ConsumerStatefulWidget {
  const AnnouncementsPage({super.key});

  static const routeName = 'announcements';
  static const routePath = '/backoffice/$routeName';

  @override
  ConsumerState<AnnouncementsPage> createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends ConsumerState<AnnouncementsPage>
    with RolePageMixin {
  late final ValueNotifier<AnnouncementLanguage> _selectedLanguage;
  late final ValueNotifier<AnnouncementPath?> _selectedAnnouncement;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = ValueNotifier(AnnouncementLanguage.portuguese);
    _selectedAnnouncement = ValueNotifier(null);
  }

  @override
  void dispose() {
    _selectedLanguage.dispose();
    _selectedAnnouncement.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageContent(
      key: const Key('announcements-page'),
      title: 'Announcements',
      showBackButton: true,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Expanded(
              child: Material(
                color: Colors.grey.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade700, width: 2),
                ),
                clipBehavior: Clip.antiAlias,
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 15,
                        child: ValueListenableBuilder(
                          valueListenable: _selectedLanguage,
                          builder: (context, value, child) {
                            return Column(
                              children: [
                                for (final language
                                    in AnnouncementLanguage.values)
                                  AnnouncementSelectionItem(
                                    title: language.title,
                                    isSelected: value == language,
                                    onTap: () {
                                      _selectedLanguage.value = language;
                                      _selectedAnnouncement.value = null;
                                    },
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.grey.shade700,
                        width: 2,
                      ),
                      Expanded(
                        flex: 15,
                        child: ValueListenableBuilder(
                          valueListenable: _selectedLanguage,
                          builder: (context, selectedLanguage, child) {
                            return Consumer(
                              builder: (context, ref, child) {
                                final announcements = ref.watch(
                                  allAnnouncementsProvider(selectedLanguage),
                                );

                                return announcements.when(
                                  data: (data) => ValueListenableBuilder(
                                    valueListenable: _selectedAnnouncement,
                                    builder:
                                        (context, selectedAnnouncement, child) {
                                          return Column(
                                            children: [
                                              for (final announcement in data)
                                                AnnouncementSelectionItem(
                                                  title: announcement.path,
                                                  isSelected:
                                                      selectedAnnouncement ==
                                                      announcement,
                                                  onTap: () {
                                                    _selectedAnnouncement
                                                            .value =
                                                        announcement;
                                                  },
                                                ),
                                            ],
                                          );
                                        },
                                  ),
                                  error: (error, stackTrace) =>
                                      Text(error.toString()),
                                  loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.grey.shade700,
                        width: 2,
                      ),
                      Expanded(
                        flex: 70,
                        child: SizedBox(
                          height: 1000,
                          child: ValueListenableBuilder(
                            valueListenable: _selectedAnnouncement,
                            builder: (context, selectedAnnouncement, child) {
                              if (selectedAnnouncement == null) {
                                return const SizedBox.shrink();
                              }

                              return Consumer(
                                builder: (context, ref, child) {
                                  final announcement = ref.watch(
                                    announcementProvider(selectedAnnouncement),
                                  );

                                  return announcement.when(
                                    data: (data) => MarkdownWidget(
                                      padding: const EdgeInsets.all(16),
                                      data: data.markdownData,
                                    ),
                                    error: (error, stackTrace) =>
                                        Text(error.toString()),
                                    loading: () => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            IconButton.filled(
              style: IconButton.styleFrom(
                backgroundColor: Colors.green.shade900,
              ),
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }

  @override
  UserRoleName get userRoleName => UserRoleName.announcementsCreator;
}
