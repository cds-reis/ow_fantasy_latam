import 'package:flutter/material.dart';

class AnnouncementsView extends StatelessWidget {
  const AnnouncementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'OW Fantasy - LATAM',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
