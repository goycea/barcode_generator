import 'package:flutter/material.dart';

class IconConstant {
  static IconConstant instance = IconConstant._init();
  IconConstant._init();

  final startIcon = Icon(Icons.play_arrow);
  final settingIcon = Icon(Icons.settings);
  final closeIcon = Icon(Icons.close);
  final restartIcon = Icon(Icons.restart_alt_rounded);
  final menuIcon = Icon(Icons.menu);
  final worldIcon = Icon(Icons.add_chart);
}
