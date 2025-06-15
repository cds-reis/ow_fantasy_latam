import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'main.dart';
import 'pages/about/about_page.dart';
import 'pages/backoffice/backoffice_page.dart';
import 'pages/error_page/error_page.dart';
import 'pages/fantasy/fantasy_page.dart';
import 'pages/help/help_page.dart';
import 'pages/home/home_page.dart';
import 'pages/leaderboard/leaderboard_page.dart';
import 'pages/login/login_page.dart';
import 'pages/login/sign_up_page.dart';
import 'pages/privacy/privacy_policy.dart';
import 'pages/terms/terms_conditions.dart';
import 'providers/backofiice/is_user_backoffice_provider.dart';
import 'widgets/fantasy_app_bar.dart';
import 'widgets/fantasy_drawer.dart';

final router = GoRouter(
  initialLocation: HomePage.routeName,
  observers: [TalkerRouteObserver(talker)],
  routes: [
    ShellRoute(
      builder: _shellBuilder,
      routes: [
        GoRoute(
          path: HomePage.routeName,
          pageBuilder: _pageBuilder(const HomePage()),
        ),
        GoRoute(
          path: FantasyPage.routeName,
          redirect: (context, state) {
            final user = Supabase.instance.client.auth.currentUser;
            if (user == null) {
              return LoginPage.routeName;
            }
            return null;
          },
          pageBuilder: _pageBuilder(const FantasyPage()),
        ),
        GoRoute(
          path: LeaderboardPage.routeName,
          pageBuilder: _pageBuilder(const LeaderboardPage()),
        ),
        GoRoute(
          path: AboutPage.routeName,
          pageBuilder: _pageBuilder(const AboutPage()),
        ),
        GoRoute(
          path: HelpPage.routeName,
          pageBuilder: _pageBuilder(const HelpPage()),
        ),
        GoRoute(
          path: LoginPage.routeName,
          pageBuilder: _pageBuilder(const LoginPage()),
        ),
        GoRoute(
          path: SignUpPage.routeName,
          pageBuilder: _pageBuilder(const SignUpPage()),
        ),
        GoRoute(
          path: PrivacyPolicy.routeName,
          pageBuilder: _pageBuilder(const PrivacyPolicy()),
        ),
        GoRoute(
          path: TermsConditions.routeName,
          pageBuilder: _pageBuilder(const TermsConditions()),
        ),
        GoRoute(
          path: ErrorPage.routeName,
          pageBuilder: _pageBuilder(const ErrorPage()),
        ),
        GoRoute(
          path: BackofficePage.routeName,
          redirect: (context, state) async {
            final client = Supabase.instance.client;
            final user = client.auth.currentUser;
            if (user == null) {
              return ErrorPage.routeName;
            }

            final isUserBackoffice = await isUserBackofficeUseCase(client);

            if (!isUserBackoffice) {
              return ErrorPage.routeName;
            }

            return null;
          },
          pageBuilder: _pageBuilder(const BackofficePage()),
        ),
      ],
    ),
  ],
  errorPageBuilder: _pageBuilder(const ErrorPage()),
);

Widget _shellBuilder(BuildContext context, GoRouterState state, Widget child) {
  return Scaffold(
    drawer: const FantasyDrawer(),
    body: Column(
      children: [
        const FantasyAppBar(),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: child,
          ),
        ),
      ],
    ),
  );
}

Page<T> Function(BuildContext context, GoRouterState state) _pageBuilder<T>(
  Widget page,
) {
  return (_, _) {
    return NoTransitionPage(child: page);
  };
}
