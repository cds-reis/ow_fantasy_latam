import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/about/about_page.dart';
import '../pages/fantasy/fantasy_page.dart';
import '../pages/help/help_page.dart';
import '../pages/home/home_page.dart';
import '../pages/leaderboard/leaderboard_page.dart';
import '../utils/hardstring.dart';
import 'login_button.dart';

class FantasyAppBar extends AppBar {
  FantasyAppBar({super.key})
    : super(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Expanded(
                flex: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('OW Fantasy - LATAM'),
                    NavigationTextButton(
                      title: 'Home'.hardString,
                      route: HomePage.routeName,
                    ),
                    NavigationTextButton(
                      title: 'My Team'.hardString,
                      route: FantasyPage.routeName,
                    ),
                    NavigationTextButton(
                      title: 'Leaderboard'.hardString,
                      route: LeaderboardPage.routeName,
                    ),
                    NavigationTextButton(
                      title: 'About'.hardString,
                      route: AboutPage.routeName,
                    ),
                    NavigationTextButton(
                      title: 'Help'.hardString,
                      route: HelpPage.routeName,
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 30),
              const LoginButton(),
            ],
          ),
        ),
      );
}

class NavigationTextButton extends StatelessWidget {
  const NavigationTextButton({
    required this.title,
    required this.route,
    super.key,
  });

  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushReplacement(route);
      },
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
