import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // ============== Helper Methods ==============

  /// Get text color based on theme
  static Color getTextColor(BuildContext context) {
    return Theme.of(context).colorScheme.onSurface;
  }

  /// Get secondary text color based on theme
  static Color getSecondaryTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF8696A0)
        : const Color(0xFF667781);
  }

  /// Get primary color from theme
  static Color getPrimaryColor(BuildContext context) {
    return Theme.of(context).colorScheme.primary;
  }

  // ============== Display Styles (Large Headlines) ==============

  static TextStyle displayLarge(BuildContext context) => GoogleFonts.roboto(
    fontSize: 57.sp,
    fontWeight: FontWeight.w400,
    color: getTextColor(context),
    letterSpacing: -0.25,
  );

  static TextStyle displayMedium(BuildContext context) => GoogleFonts.roboto(
    fontSize: 45.sp,
    fontWeight: FontWeight.w400,
    color: getTextColor(context),
  );

  static TextStyle displaySmall(BuildContext context) => GoogleFonts.roboto(
    fontSize: 36.sp,
    fontWeight: FontWeight.w400,
    color: getTextColor(context),
  );

  // ============== Headline Styles ==============

  static TextStyle headlineLarge(BuildContext context) => GoogleFonts.roboto(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: getTextColor(context),
  );

  static TextStyle headlineMedium(BuildContext context) => GoogleFonts.roboto(
    fontSize: 28.sp,
    fontWeight: FontWeight.w600,
    color: getTextColor(context),
  );

  static TextStyle headlineSmall(BuildContext context) => GoogleFonts.roboto(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: getTextColor(context),
  );

  // ============== Title Styles ==============

  static TextStyle titleLarge(BuildContext context) => GoogleFonts.roboto(
    fontSize: 22.sp,
    fontWeight: FontWeight.w500,
    color: getTextColor(context),
  );

  static TextStyle titleMedium(BuildContext context) => GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: getTextColor(context),
    letterSpacing: 0.15,
  );

  static TextStyle titleSmall(BuildContext context) => GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: getTextColor(context),
    letterSpacing: 0.1,
  );

  // ============== Body Text Styles ==============

  static TextStyle bodyLarge(BuildContext context) => GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: getTextColor(context),
    letterSpacing: 0.5,
    height: 1.5,
  );

  static TextStyle bodyMedium(BuildContext context) => GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: getTextColor(context),
    letterSpacing: 0.25,
    height: 1.43,
  );

  static TextStyle bodySmall(BuildContext context) => GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: getTextColor(context),
    letterSpacing: 0.4,
    height: 1.33,
  );

  // ============== Label Styles (Buttons, Tabs) ==============

  static TextStyle labelLarge(BuildContext context) => GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: getTextColor(context),
    letterSpacing: 0.5,
  );

  static TextStyle labelMedium(BuildContext context) => GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: getTextColor(context),
    letterSpacing: 0.5,
  );

  static TextStyle labelSmall(BuildContext context) => GoogleFonts.roboto(
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    color: getTextColor(context),
    letterSpacing: 0.5,
  );

  // ============== App Bar Styles ==============

  static TextStyle appBarTitle(BuildContext context) => GoogleFonts.roboto(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: Theme.of(context).appBarTheme.foregroundColor,
    letterSpacing: 0.15,
  );

  static TextStyle appBarSubtitle(BuildContext context) => GoogleFonts.roboto(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFFB3B3B3)
        : const Color(0xFFE0E0E0),
  );

  // ============== Button Text Styles ==============

  static TextStyle buttonLarge(BuildContext context) => GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  static TextStyle buttonMedium(BuildContext context) => GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  static TextStyle buttonSmall(BuildContext context) => GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  static TextStyle textButton(BuildContext context) => GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: getPrimaryColor(context),
    letterSpacing: 0.5,
  );

  // ============== Input Field Styles ==============

  static TextStyle inputText(BuildContext context) => GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: getTextColor(context),
  );

  static TextStyle inputLabel(BuildContext context) => GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: getSecondaryTextColor(context),
  );

  static TextStyle inputHint(BuildContext context) => GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: getSecondaryTextColor(context),
  );

  static TextStyle inputError(BuildContext context) => GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.error,
  );

  // ============== List Item Styles ==============

  static TextStyle listTitle(BuildContext context) => GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: getTextColor(context),
  );

  static TextStyle listSubtitle(BuildContext context) => GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: getSecondaryTextColor(context),
  );

  static TextStyle listCaption(BuildContext context) => GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: getSecondaryTextColor(context),
  );

  // ============== Chat Styles ==============

  static TextStyle chatName(BuildContext context) => GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: getTextColor(context),
  );

  static TextStyle chatMessage(BuildContext context) => GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: getSecondaryTextColor(context),
  );

  static TextStyle chatTime(BuildContext context) => GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: getSecondaryTextColor(context),
  );

  static TextStyle messageText(BuildContext context) => GoogleFonts.roboto(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: getTextColor(context),
    height: 1.4,
  );

  static TextStyle messageTime(BuildContext context) => GoogleFonts.roboto(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    color: getSecondaryTextColor(context),
  );

  // ============== Badge & Chip Styles ==============

  static TextStyle badge(BuildContext context) => GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle chip(BuildContext context) => GoogleFonts.roboto(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    color: getTextColor(context),
  );

  // ============== Caption & Overline ==============

  static TextStyle caption(BuildContext context) => GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: getSecondaryTextColor(context),
  );

  static TextStyle overline(BuildContext context) => GoogleFonts.roboto(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: getSecondaryTextColor(context),
    letterSpacing: 1.5,
  );

  // ============== Custom Styles ==============

  /// Create a completely custom text style
  static TextStyle custom({
    required BuildContext context,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    double? wordSpacing,
    TextDecoration? decoration,
    Color? decorationColor,
    FontStyle? fontStyle,
  }) => GoogleFonts.roboto(
    fontSize: fontSize?.sp ?? 14.sp,
    fontWeight: fontWeight ?? FontWeight.w400,
    color: color ?? getTextColor(context),
    letterSpacing: letterSpacing,
    height: height,
    wordSpacing: wordSpacing,
    decoration: decoration,
    decorationColor: decorationColor,
    fontStyle: fontStyle,
  );

  // ============== Text Style with Primary Color ==============

  static TextStyle withPrimaryColor(
    BuildContext context, {
    double? fontSize,
    FontWeight? fontWeight,
  }) => GoogleFonts.roboto(
    fontSize: fontSize?.sp ?? 14.sp,
    fontWeight: fontWeight ?? FontWeight.w400,
    color: getPrimaryColor(context),
  );

  // ============== Text Style with Secondary Color ==============

  static TextStyle withSecondaryColor(
    BuildContext context, {
    double? fontSize,
    FontWeight? fontWeight,
  }) => GoogleFonts.roboto(
    fontSize: fontSize?.sp ?? 14.sp,
    fontWeight: fontWeight ?? FontWeight.w400,
    color: getSecondaryTextColor(context),
  );

  // ============== Bold Styles ==============

  static TextStyle bold(BuildContext context, {double? fontSize}) =>
      GoogleFonts.roboto(
        fontSize: fontSize?.sp ?? 14.sp,
        fontWeight: FontWeight.w700,
        color: getTextColor(context),
      );

  static TextStyle semiBold(BuildContext context, {double? fontSize}) =>
      GoogleFonts.roboto(
        fontSize: fontSize?.sp ?? 14.sp,
        fontWeight: FontWeight.w600,
        color: getTextColor(context),
      );

  static TextStyle medium(BuildContext context, {double? fontSize}) =>
      GoogleFonts.roboto(
        fontSize: fontSize?.sp ?? 14.sp,
        fontWeight: FontWeight.w500,
        color: getTextColor(context),
      );

  static TextStyle regular(BuildContext context, {double? fontSize}) =>
      GoogleFonts.roboto(
        fontSize: fontSize?.sp ?? 14.sp,
        fontWeight: FontWeight.w400,
        color: getTextColor(context),
      );

  static TextStyle light(BuildContext context, {double? fontSize}) =>
      GoogleFonts.roboto(
        fontSize: fontSize?.sp ?? 14.sp,
        fontWeight: FontWeight.w300,
        color: getTextColor(context),
      );
}
