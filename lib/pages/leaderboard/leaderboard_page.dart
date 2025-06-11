import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../entities/leaderboard_entry.dart';
import '../../providers/leaderboard_provider.dart';
import '../../utils/build_context_extensions.dart';
import 'leaderboard_users_view.dart';
import 'user_rosters_view.dart';

class LeaderboardPage extends ConsumerStatefulWidget {
  const LeaderboardPage({super.key});

  static const String routeName = '/leaderboard';

  @override
  ConsumerState<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends ConsumerState<LeaderboardPage> {
  late final ValueNotifier<LeaderboardEntry?> entry;
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    entry = ValueNotifier(null);
    searchController = TextEditingController();
  }

  void onEntrySelected(LeaderboardEntry entry) {
    if (context.isMobile) {
      showDialog<void>(
        context: context,
        builder: (context) {
          return Dialog.fullscreen(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  UserRostersView(entry: entry),
                ],
              ),
            ),
          );
        },
      );
    } else {
      this.entry.value = entry;
    }
  }

  @override
  void dispose() {
    entry.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final leaderboard = ref.watch(leaderboardProvider);

    return leaderboard.when(
      data: (leaderboard) {
        return Center(
          child: SizedBox(
            width: 1100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Fantasy Leaderboard',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      Expanded(
                        flex: 4,
                        child: ValueListenableBuilder(
                          valueListenable: searchController,
                          builder: (_, value, _) {
                            final text = value.text;
                            final filteredLeaderboard = leaderboard
                                .where(
                                  (entry) => startsWith(
                                    entry.username.toLowerCase(),
                                    text.toLowerCase(),
                                  ),
                                )
                                .toList();

                            return LeaderboardUsersView(
                              leaderboard: filteredLeaderboard,
                              onEntrySelected: onEntrySelected,
                              searchController: searchController,
                            );
                          },
                        ),
                      ),
                      if (!context.isMobile)
                        Expanded(
                          flex: 6,
                          child: ValueListenableBuilder(
                            valueListenable: entry,
                            builder: (_, entry, _) {
                              return UserRostersView(entry: entry);
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

bool startsWith(String text, String search) {
  if (search.isEmpty) {
    return true;
  }

  return text.startsWith(search);
}
