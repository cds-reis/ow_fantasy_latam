import 'package:flutter/material.dart';

import '../../utils/hardstring.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  static const String routeName = '/help';

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Help'.hardString));
  }
}
