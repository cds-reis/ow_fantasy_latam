import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../entities/change_log/change_log_language.dart';
import 'change_logs_language_view.dart';

class ChangeLogsView extends ConsumerWidget {
  const ChangeLogsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxScrolled) {
        return [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            surfaceTintColor: Colors.grey.shade900,
            backgroundColor: Colors.grey.shade900,
            title: const TabBar(
              dividerHeight: 2,
              labelStyle: TextStyle(fontSize: 16),
              tabs: [
                Tab(text: 'Português'),
                Tab(text: 'Español'),
                Tab(text: 'English'),
              ],
            ),
          ),
        ];
      },
      body: const TabBarView(
        children: [
          ChangeLogsLanguageView(language: ChangeLogLanguage.portuguese),
          ChangeLogsLanguageView(language: ChangeLogLanguage.spanish),
          ChangeLogsLanguageView(language: ChangeLogLanguage.english),
        ],
      ),
    );
  }
}
