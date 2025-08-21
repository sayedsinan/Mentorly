import 'package:flutter/material.dart';

class ResponsiveHelper {
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 360;
  }

  static double getResponsiveFontSize(
    BuildContext context, {
    required double base,
    double? tablet,
    double? small,
  }) {
    if (isTablet(context)) return tablet ?? base * 1.2;
    if (isSmallScreen(context)) return small ?? base * 0.85;
    return base;
  }

  static double getResponsiveSize(
    BuildContext context, {
    required double base,
    double? tablet,
    double? small,
  }) {
    if (isTablet(context)) return tablet ?? base * 1.3;
    if (isSmallScreen(context)) return small ?? base * 0.8;
    return base;
  }
}
