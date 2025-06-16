enum AnnouncementLanguage {
  portuguese('portuguese', 'Português'),
  spanish('spanish', 'Español'),
  english('english', 'English');

  const AnnouncementLanguage(this.path, this.title);

  final String path;
  final String title;
}
