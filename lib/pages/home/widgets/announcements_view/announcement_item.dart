import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';

import '../../../../entities/announcement/announcement_path.dart';
import '../../../../providers/announcement_provider.dart';

class AnnouncementItem extends ConsumerWidget {
  const AnnouncementItem({required this.path, super.key});

  final AnnouncementPath path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final announcement = ref.watch(announcementProvider(path));

    return announcement.when(
      data: (data) => MarkdownBlock(data: data.markdownData),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
