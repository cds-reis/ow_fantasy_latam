import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/backofiice/is_user_backoffice_provider.dart';
import '../error_page/error_page.dart';

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
    return const Column(
      children: [
        Text('Backoffice'),
      ],
    );
  }
}
