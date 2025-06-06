import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/link.dart';

import '../../providers/supabase_provider.dart';
import '../../utils/build_context_extensions.dart';
import '../fantasy/fantasy_page.dart';
import 'login_page.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  static const routeName = '/sign-up';

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  bool _isLoading = false;
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _repeatPasswordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _repeatPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
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
                  'Sign Up',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                  textInputAction: TextInputAction.next,
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
                  decoration: const InputDecoration(labelText: 'Password'),
                  autofillHints: const [AutofillHints.password],
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  textInputAction: TextInputAction.next,
                ),
                TextField(
                  controller: _repeatPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Repeat your password',
                  ),
                  autofillHints: const [AutofillHints.password],
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _onSignUpPressed,
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
                            'Sign Up',
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
                      'Already have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    Link(
                      uri: Uri.parse(LoginPage.routeName),
                      builder: (context, followLink) => InkWell(
                        onTap: followLink,
                        child: const Text(
                          'Login',
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

  Future<void> _onSignUpPressed() async {
    setState(() {
      _isLoading = true;
    });

    try {
      if (_usernameController.text.isEmpty ||
          _emailController.text.isEmpty ||
          _passwordController.text.isEmpty) {
        context.showErrorSnackBar('Please fill all fields');
        return;
      }

      if (_usernameController.text.length < 3) {
        context.showErrorSnackBar(
          'Username must be at least 3 characters long',
        );
        return;
      }

      if (!EmailValidator.validate(_emailController.text)) {
        context.showErrorSnackBar('Please enter a valid email');
        return;
      }

      if (_passwordController.text.length < 8) {
        context.showErrorSnackBar(
          'Password must be at least 8 characters long',
        );
        return;
      }

      if (_passwordController.text != _repeatPasswordController.text) {
        context.showErrorSnackBar('Passwords do not match');
        return;
      }

      final supabase = ref.read(supabaseProvider);

      final username = _usernameController.text;
      final email = _emailController.text;
      final password = _passwordController.text;

      final response = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'username': username},
      );

      if (!mounted) {
        return;
      }

      if (response.user == null) {
        context.showErrorSnackBar('Failed to sign up');
        return;
      }

      await supabase.from('profiles').insert({
        'id': response.user!.id,
        'username': username,
      });

      context
        ..showSuccessSnackBar('Sign up successful!')
        ..pushReplacement(FantasyPage.routeName);
    } on AuthApiException catch (e) {
      if (!mounted) {
        return;
      }

      context.showErrorSnackBar(e.message);
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}
