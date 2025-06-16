import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../entities/change_log/change_log_language.dart';
import '../../../../providers/change_log_provider.dart';
import 'change_log_item.dart';

class ChangeLogsLanguageView extends ConsumerWidget {
  const ChangeLogsLanguageView({required this.language, super.key});

  final ChangeLogLanguage language;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final changeLogs = ref.watch(allChangeLogsProvider(language));

    return changeLogs.when(
      data: (data) => RawScrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        interactive: true,
        thickness: 6,
        radius: const Radius.circular(3),
        thumbColor: Colors.grey.withValues(alpha: 0.5),
        trackColor: Colors.grey.withValues(alpha: 0.1),
        minThumbLength: 50,
        crossAxisMargin: 2,
        mainAxisMargin: 2,
        child: ListView.separated(
          padding: const EdgeInsets.all(24),
          itemCount: data.length,
          itemBuilder: (context, index) => ChangeLogItem(path: data[index]),
          separatorBuilder: (context, index) => const Column(
            children: [
              Gap(24),
              Divider(),
              Gap(24),
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
