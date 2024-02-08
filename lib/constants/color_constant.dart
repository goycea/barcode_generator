import 'dart:ui';

//this is constant class. You may create other constant for instance
// padding class and, circular border class.
class ColorConstant {
  static ColorConstant instance = ColorConstant._init();
  ColorConstant._init();

  // General
  final blue = const Color(0xff94aae5);
  final darkBlue = const Color(0xff4e81e1);
  final coldSteel = const Color(0xff2a233b);
  final white = const Color(0xFFFFFFFF);
  final black = const Color(0xFF000000);
  final yellow = const Color(0xfffdb54c);
  final pomegranateFlowerColor = const Color(0xfff13c3c);
}
