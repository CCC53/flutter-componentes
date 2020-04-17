//Importaciones de flutter
import 'package:flutter/material.dart';

final _icon = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open, 
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'tune' : Icons.tune,
  'list' : Icons.list,
};

Icon getIcon(String nombreIcon) {
  return Icon(_icon[nombreIcon], color: Colors.cyan);
}