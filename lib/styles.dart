import 'package:flutter/painting.dart';

/// Convenience class to access application colors.
abstract class AppColors {
  /// Dark background color.
  static const Color backgroundColor = Color.fromARGB(0, 43,45,66);

  /// Slightly lighter version of [backgroundColor].
  static const Color backgroundFadedColor = Color(0xFF191B1C);

  /// Color used for cards and surfaces.
  static const Color cardColor = Color.fromARGB(0,232, 226, 220);

  /// Accent color used in the application.
  static const Color accentColor = Color(0xFFef8354);

  static const Color navColor =Color.fromRGBO(217, 14, 24,0);

}