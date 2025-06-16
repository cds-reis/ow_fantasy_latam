import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';

import '../../../../entities/change_log/change_log_path.dart';
import '../../../../providers/change_log_provider.dart';

class ChangeLogItem extends ConsumerWidget {
  const ChangeLogItem({required this.path, super.key});

  final ChangeLogPath path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final changeLog = ref.watch(changeLogProvider(path));

    return changeLog.when(
      data: (data) => MarkdownBlock(data: data.markdownData),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
