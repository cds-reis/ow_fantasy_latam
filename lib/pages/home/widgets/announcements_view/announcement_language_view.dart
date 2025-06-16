import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../entities/announcement/announcement_language.dart';
import '../../../../providers/announcement_provider.dart';
import 'announcement_item.dart';

class AnnouncementsLanguageView extends ConsumerWidget {
  const AnnouncementsLanguageView({required this.language, super.key});

  final AnnouncementLanguage language;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final announcements = ref.watch(allAnnouncementsProvider(language));

    return announcements.when(
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
          itemBuilder: (context, index) => AnnouncementItem(path: data[index]),
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
