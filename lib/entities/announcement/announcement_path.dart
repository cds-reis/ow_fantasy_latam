import 'announcement_language.dart';

typedef AnnouncementPathValue = ({String path, AnnouncementLanguage language});

extension type const AnnouncementPath._(AnnouncementPathValue _value) {
  const AnnouncementPath({
    required String path,
    required AnnouncementLanguage language,
  }) : _value = (path: path, language: language);

  String get path => _value.path;
  AnnouncementLanguage get language => _value.language;

  String get value => '${language.path}/$path';
}
