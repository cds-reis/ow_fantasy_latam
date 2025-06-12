import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../pages/login/login_page.dart';
import '../pages/login/sign_up_page.dart';
import '../pages/privacy/privacy_policy.dart';
import '../pages/terms/terms_conditions.dart';
import '../providers/supabase_provider.dart';

class LoginButton extends ConsumerStatefulWidget {
  const LoginButton({super.key});

  @override
  ConsumerState<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends ConsumerState<LoginButton> {
  late final JustTheController _tooltipController;

  @override
  void initState() {
    super.initState();
    _tooltipController = JustTheController();
  }

  @override
  void dispose() {
    _tooltipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final supabase = ref.watch(supabaseProvider);

    return StreamBuilder<AuthState>(
      stream: supabase.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final user = snapshot.data?.session?.user;
        final username = user?.userMetadata?['username'] as String?;

        return JustTheTooltip(
          controller: _tooltipController,
          triggerMode: TooltipTriggerMode.tap,
          isModal: true,
          backgroundColor: Colors.white,
          offset: 15,
          content: _LoginButtonTooltipContent(
            tooltipController: _tooltipController,
            user: user,
          ),
          child: _LoginButtonChild(
            tooltipController: _tooltipController,
            username: username,
          ),
        );
      },
    );
  }
}

class _LoginButtonChild extends StatelessWidget {
  const _LoginButtonChild({
    required JustTheController tooltipController,
    required this.username,
  }) : _tooltipController = tooltipController;

  final JustTheController _tooltipController;
  final String? username;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _tooltipController.showTooltip(immediately: true),
      onExit: (_) => _tooltipController.hideTooltip(immediately: false),
      child: TextButton(
        onPressed: () {
          _tooltipController.showTooltip(immediately: true);
        },
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            spacing: 8,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    username ?? 'Login',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'User',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              const Icon(Icons.person, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginButtonTooltipContent extends StatelessWidget {
  const _LoginButtonTooltipContent({
    required JustTheController tooltipController,
    required User? user,
  }) : _tooltipController = tooltipController,
       _user = user;

  final JustTheController _tooltipController;
  final User? _user;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _tooltipController.showTooltip(immediately: true),
      onExit: (_) => _tooltipController.hideTooltip(immediately: false),
      child: SizedBox(
        width: 120,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.black,
            border: Border.fromBorderSide(
              BorderSide(color: Colors.white),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 4,
              children: [
                if (_user == null) ...[
                  TextButton(
                    onPressed: () =>
                        context.pushReplacement(LoginPage.routeName),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Divider(),
                ],
                if (_user == null) ...[
                  TextButton(
                    onPressed: () =>
                        context.pushReplacement(SignUpPage.routeName),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Divider(),
                ],
                TextButton(
                  onPressed: () =>
                      context.pushReplacement(PrivacyPolicy.routeName),
                  child: const Text(
                    'Privacy',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Divider(),
                TextButton(
                  onPressed: () =>
                      context.pushReplacement(TermsConditions.routeName),
                  child: const Text(
                    'Terms',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                if (_user != null) ...[
                  const Divider(),
                  Consumer(
                    builder: (context, ref, child) {
                      return TextButton(
                        onPressed: () async {
                          final supabase = ref.read(supabaseProvider);
                          await supabase.auth.signOut();

                          if (context.mounted) {
                            context.pushReplacement(LoginPage.routeName);
                          }
                        },
                        child: const Text(
                          'Logout',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
