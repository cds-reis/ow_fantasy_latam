import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../entities/match/match.dart';
import '../../../../entities/match/player_score.dart';
import '../../../../entities/player/player.dart';
import 'player_match_item.dart';

class PlayerMatches extends ConsumerStatefulWidget {
  const PlayerMatches({required this.player, required this.matches, super.key});

  final Player player;
  final AsyncValue<IList<Match>> matches;

  @override
  ConsumerState<PlayerMatches> createState() => _TeamMatchesState();
}

class _TeamMatchesState extends ConsumerState<PlayerMatches> {
  int page = 0;
  static const pageSize = 10;

  @override
  Widget build(BuildContext context) {
    final matches = widget.matches;

    if (matches.isLoading) {
      return const SizedBox.square(
        dimension: 100,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (matches.hasError) {
      return Text('Error loading matches: ${matches.error}');
    }

    final matchesToShow = matches.requireValue
        .where((match) => match.isCompleted)
        .skip(page * pageSize)
        .take(pageSize)
        .toList();

    return ListView.separated(
      itemCount: matchesToShow.length,
      separatorBuilder: (context, index) => const Gap(16),
      itemBuilder: (context, index) {
        final match = matchesToShow[index];
        return TeamMatchItem(
          match: match,
          playerScore: PlayerScore(
            playerId: widget.player.id,
            score: match.playerScores
                .firstWhere(
                  (e) => e.playerId == widget.player.id,
                  orElse: () =>
                      PlayerScore(playerId: widget.player.id, score: 0),
                )
                .score,
          ),
        );
      },
    );
  }
}
