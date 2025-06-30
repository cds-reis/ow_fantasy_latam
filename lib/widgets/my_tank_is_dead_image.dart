import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class MyTankIsDeadImage extends StatelessWidget {
  const MyTankIsDeadImage({super.key});

  static final Uri _uri = Uri.parse(
    'https://x.com/ludwig2k/status/1938383912666886623',
  );

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: _uri,
      target: LinkTarget.blank,
      builder: (context, followLink) {
        return InkWell(
          onTap: followLink,
          child: Image.network(
            'https://hqhudvgihomrtesqkiww.supabase.co/storage/v1/object/public/random//meu_tank_esta_morto.png',
          ),
        );
      },
    );
  }
}
