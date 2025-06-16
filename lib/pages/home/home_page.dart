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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24,
        children: [
          if (!isMobile)
            const Expanded(
              child: SizedBox(
                height: 1200,
                child: HomeViewItem(child: BestPlayersView()),
              ),
            ),
          const Expanded(
            child: SizedBox(
              height: 1800,
              child: HomeViewItem(
                padding: EdgeInsets.only(top: 24),
                child: AnnouncementsView(),
              ),
            ),
          ),
          if (!isMobile)
            const Expanded(
              child: SizedBox(
                height: 1200,
                child: HomeViewItem(child: NextMatchesView()),
              ),
            ),
        ],
      ),
    );
  }
}
