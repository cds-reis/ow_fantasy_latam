import 'package:flutter/material.dart';

import '../../utils/hardstring.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const String routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('About'.hardString));
  }
}
