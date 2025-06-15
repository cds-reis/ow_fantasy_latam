import 'dart:async';

import 'package:fetch_client/fetch_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger_observer.dart';

import 'config/constants.dart' as constants;
import 'router.dart';

final Talker talker = TalkerFlutter.init();

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      usePathUrlStrategy();

      await _setUpSupabase();

      _setUpLogging();

      runApp(const MyApp());
    },
    (error, stackTrace) {
      talker.error('Unhandled error', error, stackTrace);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [TalkerRiverpodObserver(talker: talker)],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'OW Fantasy - LATAM',
        theme: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(primary: Colors.cyan),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

void _setUpLogging() {
  hierarchicalLoggingEnabled = true;
  final supabaseLogger = Logger('supabase')..level = Level.ALL;
  supabaseLogger.onRecord.listen((record) {
    talker.info('${record.level.name}: ${record.time}: ${record.message}');
  });
}

Future<void> _setUpSupabase() async {
  if (constants.supabaseUrl.isEmpty) {
    talker.error('SUPABASE_URL is not set');
    throw Exception('SUPABASE_URL is not set');
  }

  if (constants.supabaseAnonKey.isEmpty) {
    talker.error('SUPABASE_ANON_KEY is not set');
    throw Exception('SUPABASE_ANON_KEY is not set');
  }

  try {
    talker.info('Initializing Supabase with URL: ${constants.supabaseUrl}');
    await Supabase.initialize(
      url: constants.supabaseUrl,
      anonKey: constants.supabaseAnonKey,
      httpClient: FetchClient(mode: RequestMode.cors),
    );
    talker.info('Supabase initialized successfully');
  } catch (e, stackTrace) {
    talker.error('Failed to initialize Supabase', e, stackTrace);
    rethrow;
  }
}
