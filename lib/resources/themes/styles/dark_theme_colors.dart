import 'package:flutter/material.dart';
import '/resources/themes/styles/color_styles.dart';

/* Dark Theme Colors
|-------------------------------------------------------------------------- */

class DarkThemeColors implements ColorStyles {
  // general
  Color get background => const Color(0xFF181818);
  Color get secondaryBackground => const Color(0xFFF2F2F2);
  Color get inputBackground => const Color(0xFF2A2A2A);

  Color get primaryContent => const Color(0xFFFFFFFF);
  Color get secondaryContent => Colors.black;
  Color get primaryAccent => const Color(0xFFF2FF5E);

  Color get surfaceBackground => Colors.white70;
  Color get surfaceContent => Colors.black;

  // app bar
  Color get appBarBackground => const Color(0xFF181818);
  Color get appBarPrimaryContent => Colors.white;

  // buttons
  Color get buttonPrimaryBackground => const Color(0xFFF2FF5E);
  Color get buttonPrimaryContent => Colors.black;
  Color get buttonSecondaryBackground => Colors.black;
  Color get buttonSecondaryContent => const Color(0xFFF2FF5E);
  Color get buttonBackground =>
      const Color(0xFFF2FF5E); // Not sure where this is used

  // Form Inputs
  Color get inputBorder => const Color(0xFF5B5B5B);

  // bottom tab bar
  Color get bottomTabBarBackground => Colors.black;

  // bottom tab bar - icons
  Color get bottomTabBarIconSelected => const Color(0xFFF2FF5E);
  Color get bottomTabBarIconUnselected => Colors.white60;

  // bottom tab bar - label
  Color get bottomTabBarLabelUnselected => Colors.white54;
  Color get bottomTabBarLabelSelected => Colors.white;
}
