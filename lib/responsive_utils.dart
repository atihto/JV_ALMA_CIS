import 'dart:developer' as developer;

class ResponsiveUtils {
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;

  static bool isMobile(double width) => width < mobileBreakpoint;
  static bool isTablet(double width) => width >= mobileBreakpoint && width < tabletBreakpoint;
  static bool isDesktop(double width) => width >= tabletBreakpoint;

  static double getResponsivePadding(double width) {
    if (isMobile(width)) return 16.0;
    if (isTablet(width)) return 24.0;
    return 32.0;
  }

  static double getResponsiveFontSize(double width, double baseFontSize) {
    if (isMobile(width)) return baseFontSize * 0.9;
    if (isTablet(width)) return baseFontSize;
    return baseFontSize * 1.1;
  }

  static void logNavigation(String from, String to) {
    developer.log('Navigation: $from -> $to', name: 'ResponsiveUtils');
  }

  static void logError(String error, String context) {
    developer.log('Error in $context: $error', name: 'ResponsiveUtils', level: 1000);
  }
}
