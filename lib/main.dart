import 'package:fetch_client/fetch_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger_observer.dart';

import 'router.dart';

final Talker talker = TalkerFlutter.init();

Future<void> main() async {
  await dotenv.load();

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

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
    httpClient: fetchClient,
  );
}
