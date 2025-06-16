import 'package:flutter/material.dart';

class AnnouncementSelectionItem extends StatelessWidget {
  const AnnouncementSelectionItem({
    required this.title,
    required this.onTap,
    required this.isSelected,
    super.key,
  });

  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade700 : null,
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
