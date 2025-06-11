import 'package:flutter/material.dart';

import '../../utils/build_context_extensions.dart';
import 'widgets/announcements_view/announcements_view.dart';
import 'widgets/best_players_view/best_players_view.dart';
import 'widgets/home_view_item.dart';
import 'widgets/next_matches_view/next_matches_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;

    return SingleChildScrollView(
      child: SizedBox(
        height: 1200,
        child: Row(
          spacing: 24,
          children: [
            if (!isMobile)
              const Expanded(child: HomeViewItem(child: BestPlayersView())),
            const Expanded(child: HomeViewItem(child: AnnouncementsView())),
            if (!isMobile)
              const Expanded(child: HomeViewItem(child: NextMatchesView())),
          ],
        ),
      ),
    );
  }
}
