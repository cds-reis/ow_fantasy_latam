import 'package:flutter/material.dart';

import '../../../../utils/build_context_extensions.dart';

class AnnouncementsView extends StatelessWidget {
  const AnnouncementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'OW Fantasy - LATAM',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Text(
          'We added support for mobile devices!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Flex(
          direction: context.isMobile ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Image.network(
              'https://hqhudvgihomrtesqkiww.supabase.co/storage/v1/object/public/random//ligtat.jpg',
              height: 500,
            ),
            Image.network(
              'https://hqhudvgihomrtesqkiww.supabase.co/storage/v1/object/public/random//luna.jpg',
              height: 500,
            ),
          ],
        ),
      ],
    );
  }
}
