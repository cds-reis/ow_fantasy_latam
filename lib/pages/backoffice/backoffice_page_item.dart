import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackofficePageItem extends StatelessWidget {
  const BackofficePageItem({
    required this.title,
    required this.icon,
    required this.routePath,
    super.key,
  });

  final String title;
  final IconData icon;
  final String routePath;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey, width: 2),
      ),
      color: Colors.grey.withValues(alpha: 0.1),
      child: InkWell(
        onTap: () {
          context.pushReplacement(routePath);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            spacing: 8,
            children: [
              Icon(icon, size: 24),
              Text(
                title,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
