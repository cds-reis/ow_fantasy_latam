import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../entities/user/user_role_name.dart';
import '../../providers/roles/get_user_roles.dart';
import '../error_page/error_page.dart';

mixin RolePageMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  UserRoleName get userRoleName;

  @override
  void initState() {
    super.initState();
    unawaited(_checkUserRole());
  }

  Future<void> _checkUserRole() async {
    final userRoles = await ref.read(getUserRolesProvider.future);
    if (userRoles.none((role) => role.name == userRoleName)) {
      if (mounted) {
        context.pushReplacement(ErrorPage.routeName);
      }
    }
  }
}
