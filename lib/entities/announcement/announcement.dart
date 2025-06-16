import 'dart:convert';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';

import 'announcement_path.dart';

class Announcement extends Equatable {
  const Announcement({required this.path, required this.markdownData});

  factory Announcement.fromBytes({
    required Uint8List bytes,
    required AnnouncementPath path,
  }) {
    return Announcement(path: path, markdownData: utf8.decode(bytes));
  }

  final AnnouncementPath path;
  final String markdownData;

  @override
  List<Object?> get props => [path, markdownData];
}
