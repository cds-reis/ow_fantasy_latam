import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../entities/leaderboard_entry.dart';
import 'leaderboard_header.dart';
import 'leaderboard_item.dart';

class LeaderboardUsersView extends StatelessWidget {
  const LeaderboardUsersView({
    required this.leaderboard,
    required this.onEntrySelected,
    required this.searchController,
    super.key,
  });

  final List<LeaderboardEntry> leaderboard;
  final ValueSetter<LeaderboardEntry> onEntrySelected;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0xFF26282B),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
      ),
      child: SizedBox(
        height: 1000,
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: LeaderboardHeader(),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    bottom: 24,
                    left: 24,
                    right: 24,
                  ),
                  itemCount: leaderboard.length,
                  separatorBuilder: (context, index) => const Gap(16),
                  itemBuilder: (context, index) {
                    final entry = leaderboard[index];

                    return LeaderboardItem(
                      entry: entry,
                      onEnter: () => onEntrySelected(entry),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
