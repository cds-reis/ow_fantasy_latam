import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/link.dart';

import '../pages/about/about_page.dart';
import '../pages/fantasy/fantasy_page.dart';
import '../pages/help/help_page.dart';
import '../pages/home/home_page.dart';
import '../pages/leaderboard/leaderboard_page.dart';
import '../utils/hardstring.dart';
import 'login_button.dart';

class FantasyAppBar extends StatelessWidget {
  const FantasyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            Expanded(
              flex: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Image.asset(
                          'images/cartola_ow.webp',
                          height: 48,
                        ),
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
    final uri = Uri.parse(route);

    return Link(
      uri: uri,
      builder: (context, child) {
        return TextButton(
          onPressed: () {
            context.pushReplacement(route);
          },
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        );
      },
    );
  }
}
