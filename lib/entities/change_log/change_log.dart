import 'dart:convert';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';

import 'change_log_path.dart';

class ChangeLog extends Equatable {
  const ChangeLog({required this.path, required this.markdownData});

  factory ChangeLog.fromBytes({
    required Uint8List bytes,
    required ChangeLogPath path,
  }) {
    return ChangeLog(path: path, markdownData: utf8.decode(bytes));
  }

  final ChangeLogPath path;
  final String markdownData;

  @override
  List<Object?> get props => [path, markdownData];
}
