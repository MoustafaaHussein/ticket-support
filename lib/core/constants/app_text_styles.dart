import 'package:flutter/material.dart';
import 'package:ticket_app/core/helpers/size_config.dart';
import 'package:ticket_app/core/theme/app_theme_colors.dart';

abstract class AppTextStyles {
  static AppThemeColors _colors(BuildContext context) => context.colors;

  static TextStyle _style(
    BuildContext context, {
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
  }) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(context, fontSize: fontSize),
      fontWeight: fontWeight,
    );
  }

  // Medium (w500) — primary text
  static TextStyle medium13Primary(BuildContext context) => _style(
        context,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: _colors(context).primaryText,
      );

  static TextStyle medium14Primary(BuildContext context) => _style(
        context,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: _colors(context).primaryText,
      );

  static TextStyle medium16Primary(BuildContext context) => _style(
        context,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: _colors(context).primaryText,
      );

  static TextStyle medium18Primary(BuildContext context) => _style(
        context,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: _colors(context).primaryText,
      );

  static TextStyle medium20Primary(BuildContext context) => _style(
        context,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: _colors(context).primaryText,
      );

  static TextStyle medium24Primary(BuildContext context) => _style(
        context,
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: _colors(context).primaryText,
      );

  // Medium (w500) — secondary text
  static TextStyle medium13Secondary(BuildContext context) => _style(
        context,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: _colors(context).secondaryText,
      );

  static TextStyle medium14Secondary(BuildContext context) => _style(
        context,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: _colors(context).secondaryText,
      );

  static TextStyle medium16Secondary(BuildContext context) => _style(
        context,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: _colors(context).secondaryText,
      );

  static TextStyle medium18Secondary(BuildContext context) => _style(
        context,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: _colors(context).secondaryText,
      );

  static TextStyle medium20Secondary(BuildContext context) => _style(
        context,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: _colors(context).secondaryText,
      );

  static TextStyle medium24Secondary(BuildContext context) => _style(
        context,
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: _colors(context).secondaryText,
      );

  // SemiBold (w600) — primary text
  static TextStyle semiBold13Primary(BuildContext context) => _style(
        context,
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: _colors(context).primaryText,
      );

  static TextStyle semiBold14Primary(BuildContext context) => _style(
        context,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: _colors(context).primaryText,
      );

  static TextStyle semiBold16Primary(BuildContext context) => _style(
        context,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: _colors(context).primaryText,
      );

  static TextStyle semiBold18Primary(BuildContext context) => _style(
        context,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: _colors(context).primaryText,
      );

  static TextStyle semiBold20Primary(BuildContext context) => _style(
        context,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: _colors(context).primaryText,
      );

  static TextStyle semiBold24Primary(BuildContext context) => _style(
        context,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: _colors(context).primaryText,
      );

  static TextStyle semiBold30Primary(BuildContext context) => _style(
        context,
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: _colors(context).primaryText,
      );

  // SemiBold (w600) — secondary text
  static TextStyle semiBold13Secondary(BuildContext context) => _style(
        context,
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: _colors(context).secondaryText,
      );

  static TextStyle semiBold14Secondary(BuildContext context) => _style(
        context,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: _colors(context).secondaryText,
      );

  static TextStyle semiBold16Secondary(BuildContext context) => _style(
        context,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: _colors(context).secondaryText,
      );

  static TextStyle semiBold18Secondary(BuildContext context) => _style(
        context,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: _colors(context).secondaryText,
      );

  static TextStyle semiBold20Secondary(BuildContext context) => _style(
        context,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: _colors(context).secondaryText,
      );

  static TextStyle semiBold24Secondary(BuildContext context) => _style(
        context,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: _colors(context).secondaryText,
      );

  static TextStyle semiBold30Secondary(BuildContext context) => _style(
        context,
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: _colors(context).secondaryText,
      );

  // Bold (w700) — primary text
  static TextStyle bold13Primary(BuildContext context) => _style(
        context,
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: _colors(context).primaryText,
      );

  static TextStyle bold14Primary(BuildContext context) => _style(
        context,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: _colors(context).primaryText,
      );

  static TextStyle bold16Primary(BuildContext context) => _style(
        context,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: _colors(context).primaryText,
      );

  static TextStyle bold18Primary(BuildContext context) => _style(
        context,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: _colors(context).primaryText,
      );

  static TextStyle bold20Primary(BuildContext context) => _style(
        context,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: _colors(context).primaryText,
      );

  static TextStyle bold24Primary(BuildContext context) => _style(
        context,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: _colors(context).primaryText,
      );

  // Bold (w700) — secondary text
  static TextStyle bold13Secondary(BuildContext context) => _style(
        context,
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: _colors(context).secondaryText,
      );

  static TextStyle bold14Secondary(BuildContext context) => _style(
        context,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: _colors(context).secondaryText,
      );

  static TextStyle bold16Secondary(BuildContext context) => _style(
        context,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: _colors(context).secondaryText,
      );

  static TextStyle bold18Secondary(BuildContext context) => _style(
        context,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: _colors(context).secondaryText,
      );

  static TextStyle bold20Secondary(BuildContext context) => _style(
        context,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: _colors(context).secondaryText,
      );

  static TextStyle bold24Secondary(BuildContext context) => _style(
        context,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: _colors(context).secondaryText,
      );
}

double getResponsiveFontSize(
  BuildContext context, {
  required double fontSize,
}) {
  final scaleFactor = getScaleFactor(context);
  final responsiveFontSize = fontSize * scaleFactor;

  final lowerLimit = fontSize * 0.8;
  final upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;

  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
