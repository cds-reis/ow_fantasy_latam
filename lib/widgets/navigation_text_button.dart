import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/link.dart';

class NavigationTextButton extends StatelessWidget {
  const NavigationTextButton.appBar({
    required this.title,
    required this.route,
    super.key,
  }) : _isDrawer = false;

  const NavigationTextButton.drawer({
    required this.title,
    required this.route,
    super.key,
  }) : _isDrawer = true;

  final String title;
  final String route;
  final bool _isDrawer;

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(route);

    return Link(
      uri: uri,
      builder: (context, child) {
        return TextButton(
          onPressed: () {
            context.pushReplacement(route);
            if (_isDrawer) {
              Scaffold.of(context).closeDrawer();
            }
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
