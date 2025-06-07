import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    required this.page,
    required this.maxPage,
    required this.onPageForward,
    required this.onPageBack,
    super.key,
  });

  final int page;
  final int maxPage;
  final VoidCallback? onPageBack;
  final VoidCallback? onPageForward;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPageBack,
          icon: const Icon(Icons.arrow_left),
        ),
        Text(
          '$page / $maxPage',
          style: const TextStyle(fontSize: 16),
        ),
        IconButton(
          onPressed: onPageForward,
          icon: const Icon(Icons.arrow_right),
        ),
      ],
    );
  }
}
