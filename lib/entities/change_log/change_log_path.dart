import 'change_log_language.dart';

extension type const ChangeLogPath._(String _value) implements String {
  ChangeLogPath({
    required String path,
    required ChangeLogLanguage language,
  }) : _value = '${language.path}/$path';
}
