import 'package:flutter/material.dart';

import '../../utils/hardstring.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  static const String routeName = '/help';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 1200,
        child: SelectionArea(
          child: Column(
            spacing: 24,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Help'.hardString,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        'Roster Construction',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Five players are needed: one tank, two DPS, and two supports.',
                      ),
                      Text(
                        'A maximum of two players are allowed from a single team.',
                      ),
                      Text('You can create a roster for each season.'),
                      Text('The players must be within budget.'),
                      Text(
                        'After the first week roster deadline of the current stage, you will only be able to submit changes to your existing roster subject to the transfer rules. (2 transfers a week for each roster)',
                      ),
                      Text(
                        'Your score will be counted when a match is played.',
                      ),
                      Divider(),
                      Text(
                        'Scoring',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Three eliminations will score a player 1 point.'),
                      Text('One death will earn the player -1 point..'),
                      Text(
                        '2,000 healing done will earn the player 0.5 points.',
                      ),
                      Text(
                        '2,000 damage done will earn the player 0.5 points.',
                      ),
                      Text(
                        'Total weekly scoring for a player is determined by aggregating their performance across all maps played in that gameweek.',
                      ),
                      Text(
                        "Your team's score is calculated as a combined total of all five players' scores.",
                      ),
                      Text('Highest score wins!'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
