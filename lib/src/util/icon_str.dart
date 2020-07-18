import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'watch_counter': Icons.access_time,
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open
};

Icon getIcon(String name) {
  return Icon(
    _icons[name],
    color: Colors.blueGrey,
  );
}
