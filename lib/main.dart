import 'package:fetch_client/fetch_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger_observer.dart';

import 'router.dart';
import 'utils/constants.dart';

final Talker talker = TalkerFlutter.init();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();

  await _setUpSupabase();

  _setUpLogging();

  runApp(const MyApp());
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
  final fetchClient = FetchClient(mode: RequestMode.cors);

  if (supabaseUrl.isEmpty || supabaseAnonKey.isEmpty) {
    throw Exception('SUPABASE_URL or SUPABASE_ANON_KEY is not set');
  }

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
    httpClient: fetchClient,
  );
}
