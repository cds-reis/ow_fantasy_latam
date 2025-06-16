import 'package:flutter/material.dart';

import '../../../../entities/announcement/announcement_language.dart';
import 'announcement_language_view.dart';
import 'video_announcement.dart';

class AnnouncementsView extends StatelessWidget {
  const AnnouncementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        spacing: 24,
        children: [
          const Text(
            'OW Fantasy - LATAM',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Flexible(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: VideoAnnouncement(),
            ),
          ),
          Visibility(
            visible: false,
            child: Expanded(
              child: Builder(
                builder: (context) {
                  return NestedScrollView(
                    floatHeaderSlivers: true,
                    headerSliverBuilder: (context, innerBoxScrolled) {
                      return [
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          pinned: true,
                          surfaceTintColor: Colors.grey.shade900,
                          backgroundColor: Colors.grey.shade900,
                          title: const TabBar(
                            dividerHeight: 2,
                            labelStyle: TextStyle(fontSize: 16),
                            tabs: [
                              Tab(text: 'Português'),
                              Tab(text: 'Español'),
                              Tab(text: 'English'),
                            ],
                          ),
                        ),
                      ];
                    },
                    body: const TabBarView(
                      children: [
                        AnnouncementsLanguageView(
                          language: AnnouncementLanguage.portuguese,
                        ),
                        AnnouncementsLanguageView(
                          language: AnnouncementLanguage.spanish,
                        ),
                        AnnouncementsLanguageView(
                          language: AnnouncementLanguage.english,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
