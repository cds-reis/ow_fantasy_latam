import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entities/user/user_role_name.dart';
import '../../../widgets/page_content.dart';
import '../role_page_mixin.dart';

class CreatePlayerScoresPage extends ConsumerStatefulWidget {
  const CreatePlayerScoresPage({super.key});

  static const routeName = 'create-player-scores';
  static const routePath = '/backoffice/$routeName';

  @override
  ConsumerState<CreatePlayerScoresPage> createState() =>
      _CreatePlayerScoresPageState();
}

class _CreatePlayerScoresPageState extends ConsumerState<CreatePlayerScoresPage>
    with RolePageMixin {
  @override
  UserRoleName get userRoleName => UserRoleName.playerScoreCreator;

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
