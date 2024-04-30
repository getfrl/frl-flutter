import 'package:nylo_framework/nylo_framework.dart';

/// Interface for your base styles.
/// Add more styles here and then implement in
/// light_theme_colors.dart and dark_theme_colors.dart.

abstract class ColorStyles extends BaseColorStyles {
  /// * Available styles *

  // general
  Color get background;
  Color get secondaryBackground;
  Color get inputBackground;

  Color get primaryContent;
  Color get primaryAccent;

  Color get surfaceBackground;
  Color get surfaceContent;

  // app bar
  Color get appBarBackground;
  Color get appBarPrimaryContent;

  // buttons
  Color get buttonPrimaryBackground;
  Color get buttonPrimaryContent;
  Color get buttonSecondaryBackground;
  Color get buttonSecondaryContent;

  // bottom tab bar
  Color get bottomTabBarBackground;

  // bottom tab bar - icons
  Color get bottomTabBarIconSelected;
  Color get bottomTabBarIconUnselected;

  // bottom tab bar - label
  Color get bottomTabBarLabelUnselected;
  Color get bottomTabBarLabelSelected;

  // Forms Inputs
  Color get inputBorder;

  // e.g. add a new style
  // Uncomment the below:
  // Color get iconBackground;

  // Then implement in color in:
  // /resources/themes/styles/light_theme_colors
  // /resources/themes/styles/dark_theme_colors
}
