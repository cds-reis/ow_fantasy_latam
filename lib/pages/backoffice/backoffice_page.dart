import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../entities/user/user_role_name.dart';
import '../../providers/backofiice/get_user_roles.dart';
import '../../providers/backofiice/is_user_backoffice_provider.dart';
import '../../widgets/page_content.dart';
import '../error_page/error_page.dart';
import 'announcements/announcements_page.dart';
import 'backoffice_page_item.dart';
import 'create_player_scores_page/create_player_scores_page.dart';

class BackofficePage extends ConsumerStatefulWidget {
  const BackofficePage({super.key});

  static const routeName = '/backoffice';

  @override
  ConsumerState<BackofficePage> createState() => _BackofficePageState();
}

class _BackofficePageState extends ConsumerState<BackofficePage> {
  @override
  void initState() {
    super.initState();

    ref
        .read(isUserBackofficeProvider.future)
        .then((isUserBackoffice) {
          if (!isUserBackoffice && mounted) {
            context.pushReplacement(ErrorPage.routeName);
          }
        })
        .catchError((_) {
          if (mounted) {
            context.pushReplacement(ErrorPage.routeName);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    final userRoles = ref.watch(getUserRolesProvider);

    return userRoles.when(
      data: (userRoles) => PageContent(
        key: const Key('backoffice-page'),
        title: 'Backoffice',
        spacing: 16,
        children: [
          BackofficePageItem(
            shouldShow: () {
              return userRoles.any(
                (role) => role.name == UserRoleName.playerScoreCreator,
              );
            },
            title: 'Create Player Scores',
            icon: Icons.add_chart_rounded,
            routePath: CreatePlayerScoresPage.routePath,
          ),
          BackofficePageItem(
            shouldShow: () {
              return userRoles.any(
                (role) => role.name == UserRoleName.announcementsCreator,
              );
            },
            title: 'Announcements',
            icon: Icons.announcement,
            routePath: AnnouncementsPage.routePath,
          ),
        ],
      ),
      error: (error, stack) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
