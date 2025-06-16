import 'package:flutter/material.dart';

class PageContent extends StatelessWidget {
  const PageContent({
    required this.title,
    required this.children,
    this.showBackButton = false,
    this.spacing = 4,
    this.width = 1200,
    super.key,
  });

  final String title;
  final List<Widget> children;
  final bool showBackButton;
  final double spacing;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 24,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showBackButton) const BackButton(),
        SizedBox(
          width: width,
          child: SelectionArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 24,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: spacing,
                      children: children,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
