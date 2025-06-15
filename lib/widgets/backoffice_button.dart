import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../pages/backoffice/backoffice_page.dart';
import '../providers/backofiice/is_user_backoffice_provider.dart';

class BackofficeButton extends ConsumerWidget {
  const BackofficeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUserBackoffice = ref.watch(isUserBackofficeProvider);

    return isUserBackoffice.when(
      data: (isUserBackoffice) {
        if (isUserBackoffice) {
          return ElevatedButton(
            onPressed: () => context.pushReplacement(
              BackofficePage.routeName,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Text(
              'Backoffice',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
      error: (error, stackTrace) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
