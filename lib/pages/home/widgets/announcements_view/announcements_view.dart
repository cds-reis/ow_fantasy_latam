import 'package:flutter/material.dart';

import 'change_logs_view.dart';

class AnnouncementsView extends StatelessWidget {
  const AnnouncementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Column(
        spacing: 24,
        children: [
          Text(
            'OW Fantasy - LATAM',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ChangeLogsView(),
          ),
        ],
      ),
    );
  }
}
