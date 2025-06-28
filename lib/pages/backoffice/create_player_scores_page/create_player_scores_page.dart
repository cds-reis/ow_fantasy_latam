import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entities/user/user_role_name.dart';
import '../../../providers/matches/matches_for_week_provider.dart';
import '../../../providers/season_provider.dart';
import '../../../providers/week_provider.dart';
import '../../../widgets/page_content.dart';
import '../role_page_mixin.dart';
import 'create_player_scores_body.dart';

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
    return PageContent(
      key: const Key('create-player-scores-page'),
      title: 'Create Player Scores',
      showBackButton: true,
      spacing: 16,
      children: [
        const Row(
          spacing: 16,
          children: [
            Expanded(child: SeasonSelector()),
            Expanded(child: WeekSelector()),
          ],
        ),
        const MatchSelectorForWeek(),
        const Divider(),
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 800),
          child: Consumer(
            builder: (context, ref, child) {
              final selectedMatch = ref.watch(selectedMatchProvider);

              if (selectedMatch == null) {
                return const SizedBox.shrink();
              }

              return CreatePlayerScoresBody(
                key: ValueKey(selectedMatch.id),
                match: selectedMatch,
              );
            },
          ),
        ),
      ],
    );
  }
}
