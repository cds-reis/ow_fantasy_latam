import 'package:flutter/material.dart';

import '../../../widgets/page_content.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  static const routeName = 'announcements';
  static const routePath = '/backoffice/$routeName';

  @override
  Widget build(BuildContext context) {
    return const PageContent(
      key: Key('announcements-page'),
      title: 'Announcements',
      showBackButton: true,
      children: [],
    );
  }
}
