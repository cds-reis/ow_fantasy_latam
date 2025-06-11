import 'package:flutter/material.dart';

class FantasyLogo extends StatelessWidget {
  const FantasyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://hqhudvgihomrtesqkiww.supabase.co/storage/v1/object/public/logos//cartola_branco.webp',
      height: 48,
    );
  }
}
