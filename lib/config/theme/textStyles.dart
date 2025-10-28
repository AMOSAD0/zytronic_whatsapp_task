import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static String get fontFamily => GoogleFonts.roboto().fontFamily!;

  static Color _getColor(
    BuildContext context, {
    required Color light,
    required Color dark,
  }) {
    return Theme.of(context).brightness == Brightness.dark ? dark : light;
  }

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

  // ============== Chat List Styles ==============

  static TextStyle chatListName(BuildContext context) => GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: _getColor(
      context,
      light: const Color(0xFF000000),
      dark: const Color(0xFFE9EDEF),
    ),
  );

  static TextStyle chatListMessage(BuildContext context) => GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: _getColor(
      context,
      light: const Color(0xFF667781),
      dark: const Color(0xFF8696A0),
    ),
  );

  static TextStyle chatListTime(BuildContext context) => GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: _getColor(
      context,
      light: const Color(0xFF667781),
      dark: const Color(0xFF8696A0),
    ),
  );

  static TextStyle unreadBadge(BuildContext context) => GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // ============== Chat Message Styles ==============

  static TextStyle messageText(BuildContext context, {required bool isMe}) =>
      GoogleFonts.roboto(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: isMe
            ? _getColor(
                context,
                light: const Color(0xFF000000),
                dark: const Color(0xFFE9EDEF),
              )
            : _getColor(
                context,
                light: const Color(0xFF000000),
                dark: const Color(0xFFE9EDEF),
              ),
        height: 1.4,
      );

  static TextStyle messageTime(BuildContext context, {required bool isMe}) =>
      GoogleFonts.roboto(
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
        color: isMe
            ? _getColor(
                context,
                light: const Color(0xFF667781),
                dark: const Color(0xFF8696A0),
              )
            : _getColor(
                context,
                light: const Color(0xFF667781),
                dark: const Color(0xFF8696A0),
              ),
      );

  static TextStyle senderName(BuildContext context) => GoogleFonts.roboto(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: _getColor(
      context,
      light: const Color(0xFF075E54),
      dark: const Color(0xFF00A884),
    ),
  );

  // ============== Status Styles ==============

  static TextStyle statusName(BuildContext context) => GoogleFonts.roboto(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: _getColor(
      context,
      light: const Color(0xFF000000),
      dark: const Color(0xFFE9EDEF),
    ),
  );

  static TextStyle statusTime(BuildContext context) => GoogleFonts.roboto(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: _getColor(
      context,
      light: const Color(0xFF667781),
      dark: const Color(0xFF8696A0),
    ),
  );

  // ============== Input Field Styles ==============

  static TextStyle inputText(BuildContext context) => GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: _getColor(
      context,
      light: const Color(0xFF000000),
      dark: const Color(0xFFE9EDEF),
    ),
  );

  static TextStyle inputHint(BuildContext context) => GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: _getColor(
      context,
      light: const Color(0xFF667781),
      dark: const Color(0xFF8696A0),
    ),
  );

  // ============== Contact Styles ==============

  static TextStyle contactName(BuildContext context) => GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: _getColor(
      context,
      light: const Color(0xFF000000),
      dark: const Color(0xFFE9EDEF),
    ),
  );

  static TextStyle contactStatus(BuildContext context) => GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: _getColor(
      context,
      light: const Color(0xFF667781),
      dark: const Color(0xFF8696A0),
    ),
  );

  // ============== Date Divider Styles ==============

  static TextStyle dateDivider(BuildContext context) => GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: _getColor(
      context,
      light: const Color(0xFF54656F),
      dark: const Color(0xFF8696A0),
    ),
  );

  // ============== System Message Styles ==============

  static TextStyle systemMessage(BuildContext context) => GoogleFonts.roboto(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: _getColor(
      context,
      light: const Color(0xFF54656F),
      dark: const Color(0xFF8696A0),
    ),
    height: 1.4,
  );

  // ============== Button Text Styles ==============

  static TextStyle buttonText(BuildContext context) => GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  static TextStyle textButtonText(BuildContext context) => GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: _getColor(
      context,
      light: const Color(0xFF075E54),
      dark: const Color(0xFF00A884),
    ),
    letterSpacing: 0.5,
  );

  // ============== Tab Text Styles ==============

  static TextStyle tabText(BuildContext context) => GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.8,
  );

  // ============== Section Header Styles ==============

  static TextStyle sectionHeader(BuildContext context) => GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: _getColor(
      context,
      light: const Color(0xFF075E54),
      dark: const Color(0xFF00A884),
    ),
  );

  // ============== Call Styles ==============

  static TextStyle callName(BuildContext context) => GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: _getColor(
      context,
      light: const Color(0xFF000000),
      dark: const Color(0xFFE9EDEF),
    ),
  );

  static TextStyle callInfo(BuildContext context) => GoogleFonts.roboto(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: _getColor(
      context,
      light: const Color(0xFF667781),
      dark: const Color(0xFF8696A0),
    ),
  );

  // ============== Settings Styles ==============

  static TextStyle settingsTitle(BuildContext context) => GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: _getColor(
      context,
      light: const Color(0xFF000000),
      dark: const Color(0xFFE9EDEF),
    ),
  );

  static TextStyle settingsSubtitle(BuildContext context) => GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: _getColor(
      context,
      light: const Color(0xFF667781),
      dark: const Color(0xFF8696A0),
    ),
  );
}
