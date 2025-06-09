import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../pages/login/login_page.dart';
import '../providers/supabase_provider.dart';

class LoginButton extends ConsumerStatefulWidget {
  const LoginButton({super.key});

  @override
  ConsumerState<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends ConsumerState<LoginButton> {
  @override
  Widget build(BuildContext context) {
    final supabase = ref.watch(supabaseProvider);

    return StreamBuilder<AuthState>(
      stream: supabase.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final user = snapshot.data?.session?.user;
        final username = user?.userMetadata?['username'] as String?;

        return TextButton(
          onPressed: username == null
              ? () => context.pushReplacement(LoginPage.routeName)
              : null,
          child: Row(
            spacing: 8,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    username ?? 'Login',
                    style: const TextStyle(fontSize: 14, color: Colors.white),
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
        );
      },
    );
  }
}
