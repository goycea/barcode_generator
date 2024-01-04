import 'dart:ui';

//this is constant class. You may create other constant for instance
// padding class and, circular border class.
class ColorConstant {
  static ColorConstant instance = ColorConstant._init();
  ColorConstant._init();

  // General
  final red = const Color(0xffff0000);
  final green = const Color(0xff04ff00);
  final blue = const Color(0xff0047ff);
  final dark = const Color(0x81191818);
  final grey = const Color(0x813B3535);
  final blueAccent = const Color(0xFF49FFFF);
  final trans = const Color(0x00ffffff);

  //Ui
  final bottomIcon = const Color(0xffff869c);
  final firstGradient = const Color(0xff7b0069);
  final secondGradient = const Color(0xffff556d);
  final backGround = const Color(0xfff3f4f6);
  final brightTurquoise = const Color(0xff0df5e3);
  final blackHowl = const Color(0xff201a30);
  final blackVelvet = const Color(0xff242132);
  final telopea = const Color(0xff2b243e);
  final throat = const Color(0xff282538);
  final coldSteel = const Color(0xff2a233b);
  final chrysomelaGoettingensis = const Color(0xff38304c);
  final newChrysomelaGoettingensis = const Color(0xff37364b);
  final driedLavenderFlowers = const Color(0xff787582);
  final larkspurViolet = const Color(0xff8f89aa);
  final white = const Color(0xFFFFFFFF);
  final black = const Color(0xFF000000);
}
