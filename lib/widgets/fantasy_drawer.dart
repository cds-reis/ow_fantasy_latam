import 'package:flutter/material.dart';

import '../pages/about/about_page.dart';
import '../pages/fantasy/fantasy_page.dart';
import '../pages/help/help_page.dart';
import '../pages/home/home_page.dart';
import '../pages/leaderboard/leaderboard_page.dart';
import '../pages/login/login_page.dart';
import '../pages/login/sign_up_page.dart';
import '../pages/privacy/privacy_policy.dart';
import '../pages/terms/terms_conditions.dart';
import '../utils/hardstring.dart';
import 'images/fantasy_logo.dart';
import 'navigation_text_button.dart';

class FantasyDrawer extends StatelessWidget {
  const FantasyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const FantasyLogo(),
                const Text(
                  'OW Fantasy - LATAM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const Divider(),
            NavigationTextButton.drawer(
              title: 'Home'.hardString,
              route: HomePage.routeName,
            ),
            NavigationTextButton.drawer(
              title: 'My Team'.hardString,
              route: FantasyPage.routeName,
            ),
            NavigationTextButton.drawer(
              title: 'Leaderboard'.hardString,
              route: LeaderboardPage.routeName,
            ),
            NavigationTextButton.drawer(
              title: 'About'.hardString,
              route: AboutPage.routeName,
            ),
            NavigationTextButton.drawer(
              title: 'Help'.hardString,
              route: HelpPage.routeName,
            ),
            const Divider(),
            NavigationTextButton.drawer(
              title: 'Login'.hardString,
              route: LoginPage.routeName,
            ),
            NavigationTextButton.drawer(
              title: 'Sign Up'.hardString,
              route: SignUpPage.routeName,
            ),
            const Divider(),
            NavigationTextButton.drawer(
              title: 'Privacy Policy'.hardString,
              route: PrivacyPolicy.routeName,
            ),
            NavigationTextButton.drawer(
              title: 'Terms and Conditions'.hardString,
              route: TermsConditions.routeName,
            ),
          ],
        ),
      ),
    );
  }
}
