import 'package:flutter/material.dart';

import '../../../widgets/page_content.dart';

class CreatePlayerScoresPage extends StatelessWidget {
  const CreatePlayerScoresPage({super.key});

  static const routeName = 'create-player-scores';
  static const routePath = '/backoffice/$routeName';

  @override
  Widget build(BuildContext context) {
    return const PageContent(
      key: Key('create-player-scores-page'),
      title: 'Create Player Scores',
      showBackButton: true,
      children: [],
    );
  }
}
