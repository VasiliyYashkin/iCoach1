// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

abstract class FlutterFlowTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

  static FlutterFlowTheme of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color primaryBtnText;
  late Color lineColor;
  late Color primary20;
  late Color secondary20;
  late Color tertiary20;
  late Color alternate20;
  late Color overlay;
  late Color overlay0;
  late Color overlay30;
  late Color alternateTwo;
  late Color alternateTwo20;
  late Color backgroundComponents;
  late Color richBlackFOGRA39;
  late Color blue;
  late Color turquoise;
  late Color cultured;
  late Color cerise;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => {
        DeviceSize.mobile: MobileTypography(this),
        DeviceSize.tablet: TabletTypography(this),
        DeviceSize.desktop: DesktopTypography(this),
      }[deviceSize]!;
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}

class LightModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFF44BBA4);
  late Color secondaryColor = const Color(0xFF5C7AFF);
  late Color tertiaryColor = const Color(0xFF393E41);
  late Color alternate = const Color(0xFFDD1C1A);
  late Color primaryBackground = const Color(0xFFFFFFFF);
  late Color secondaryBackground = const Color(0xFFEFEFEF);
  late Color primaryText = const Color(0xFF000000);
  late Color secondaryText = const Color(0xFF9D9D9D);

  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFFE0E3E7);
  late Color primary20 = Color(0x33897DEE);
  late Color secondary20 = Color(0x3331BFAE);
  late Color tertiary20 = Color(0x33F3A743);
  late Color alternate20 = Color(0x34FF5963);
  late Color overlay = Color(0xB3FFFFFF);
  late Color overlay0 = Color(0x00FFFFFF);
  late Color overlay30 = Color(0x4CFFFFFF);
  late Color alternateTwo = Color(0xFF3A5FFF);
  late Color alternateTwo20 = Color(0x343A5FFF);
  late Color backgroundComponents = Color(0xFF1D2428);
  late Color richBlackFOGRA39 = Color(0xFF070707);
  late Color blue = Color(0xFF3A28DE);
  late Color turquoise = Color(0xFF34D1BF);
  late Color cultured = Color(0xFFEFEFEF);
  late Color cerise = Color(0xFFD1345B);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Roboto';
  TextStyle get title1 => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      );
  String get title2Family => 'Roboto';
  TextStyle get title2 => GoogleFonts.getFont(
        'Roboto',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22,
      );
  String get title3Family => 'Roboto';
  TextStyle get title3 => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20,
      );
  String get subtitle1Family => 'Roboto';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  String get subtitle2Family => 'Roboto';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Roboto',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  String get bodyText1Family => 'Roboto';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );
  String get bodyText2Family => 'Roboto';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Roboto',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Roboto';
  TextStyle get title1 => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      );
  String get title2Family => 'Roboto';
  TextStyle get title2 => GoogleFonts.getFont(
        'Roboto',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22,
      );
  String get title3Family => 'Roboto';
  TextStyle get title3 => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20,
      );
  String get subtitle1Family => 'Roboto';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  String get subtitle2Family => 'Roboto';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Roboto',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  String get bodyText1Family => 'Roboto';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );
  String get bodyText2Family => 'Roboto';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Roboto',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Roboto';
  TextStyle get title1 => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      );
  String get title2Family => 'Roboto';
  TextStyle get title2 => GoogleFonts.getFont(
        'Roboto',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22,
      );
  String get title3Family => 'Roboto';
  TextStyle get title3 => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20,
      );
  String get subtitle1Family => 'Roboto';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  String get subtitle2Family => 'Roboto';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Roboto',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  String get bodyText1Family => 'Roboto';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );
  String get bodyText2Family => 'Roboto';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Roboto',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
