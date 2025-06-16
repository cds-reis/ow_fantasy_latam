import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackofficePageItem extends StatefulWidget {
  const BackofficePageItem({
    required this.shouldShow,
    required this.title,
    required this.icon,
    required this.routePath,
    super.key,
  });

  final ValueGetter<bool> shouldShow;
  final String title;
  final IconData icon;
  final String routePath;

  @override
  State<BackofficePageItem> createState() => _BackofficePageItemState();
}

class _BackofficePageItemState extends State<BackofficePageItem> {
  bool _show = false;

  @override
  void initState() {
    super.initState();
    _show = widget.shouldShow();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _show,
      child: Material(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: 2),
        ),
        color: Colors.grey.withValues(alpha: 0.1),
        child: InkWell(
          onTap: () {
            context.pushReplacement(widget.routePath);
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              spacing: 8,
              children: [
                Icon(widget.icon, size: 24),
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
