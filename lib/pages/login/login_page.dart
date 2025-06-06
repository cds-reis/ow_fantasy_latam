import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/link.dart';

import '../../utils/build_context_extensions.dart';
import '../fantasy/fantasy_page.dart';
import 'sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SizedBox(
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 16,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: _emailController,
                  autofillHints: const [
                    AutofillHints.email,
                    AutofillHints.username,
                  ],
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                TextField(
                  controller: _passwordController,
                  autofillHints: const [AutofillHints.password],
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => onPressed(),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: _isLoading
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                Divider(color: Colors.grey.shade700),
                Row(
                  spacing: 8,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    Link(
                      uri: Uri.parse(SignUpPage.routeName),
                      builder: (context, followLink) => InkWell(
                        onTap: followLink,
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    setState(() => _isLoading = true);
    try {
      final email = _emailController.text;
      final password = _passwordController.text;

      if (email.isEmpty || password.isEmpty) {
        context.showErrorSnackBar('Please fill all fields');
        return;
      }

      if (!EmailValidator.validate(email)) {
        context.showErrorSnackBar('Please enter a valid email');
        return;
      }

      if (password.length < 8) {
        context.showErrorSnackBar(
          'Password must be at least 8 characters long',
        );
        return;
      }

      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (!mounted) {
        return;
      }

      if (response.user == null) {
        context.showErrorSnackBar('Failed to login');
        return;
      }

      context.pushReplacement(FantasyPage.routeName);
    } on AuthApiException catch (e, st) {
      FlutterError.reportError(FlutterErrorDetails(exception: e, stack: st));
      if (mounted) {
        context.showErrorSnackBar(e.message);
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}
