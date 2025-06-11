import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../pages/about/about_page.dart';
import '../pages/fantasy/fantasy_page.dart';
import '../pages/help/help_page.dart';
import '../pages/home/home_page.dart';
import '../pages/leaderboard/leaderboard_page.dart';
import '../utils/build_context_extensions.dart';
import '../utils/hardstring.dart';
import 'fantasy_logo.dart';
import 'login_button.dart';
import 'navigation_text_button.dart';

class FantasyAppBar extends StatelessWidget {
  const FantasyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.isMobile) {
      return ColoredBox(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    iconSize: 36,
                    icon: const Icon(Icons.menu),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: FantasyLogo(),
                  ),
                  const Text(
                    'OW Fantasy - LATAM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(
          bottom: BorderSide(color: Colors.white),
        ),
      ),
      child: Row(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            spacing: 8,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: FantasyLogo(),
              ),
              Text(
                'OW Fantasy - LATAM',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          NavigationTextButton.appBar(
            title: 'Home'.hardString,
            route: HomePage.routeName,
          ),
          NavigationTextButton.appBar(
            title: 'My Team'.hardString,
            route: FantasyPage.routeName,
          ),
          NavigationTextButton.appBar(
            title: 'Leaderboard'.hardString,
            route: LeaderboardPage.routeName,
          ),
          NavigationTextButton.appBar(
            title: 'About'.hardString,
            route: AboutPage.routeName,
          ),
          NavigationTextButton.appBar(
            title: 'Help'.hardString,
            route: HelpPage.routeName,
          ),
          const Gap(48),
          const LoginButton(),
        ],
      ),
    );
  }
}
