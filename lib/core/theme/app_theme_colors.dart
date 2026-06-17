import 'package:flutter/material.dart';

/// Semantic color accessors backed by the active [ColorScheme].
///
/// Use via [BuildContext.colors] so values follow [ThemeMode] automatically.
class AppThemeColors {
  const AppThemeColors(this._colorScheme);

  final ColorScheme _colorScheme;

  Color get primary => _colorScheme.primary;
  Color get onPrimary => _colorScheme.onPrimary;
  Color get primaryContainer => _colorScheme.primaryContainer;
  Color get onPrimaryContainer => _colorScheme.onPrimaryContainer;

  Color get secondary => _colorScheme.secondary;
  Color get onSecondary => _colorScheme.onSecondary;
  Color get secondaryContainer => _colorScheme.secondaryContainer;
  Color get onSecondaryContainer => _colorScheme.onSecondaryContainer;

  Color get tertiary => _colorScheme.tertiary;
  Color get onTertiary => _colorScheme.onTertiary;
  Color get tertiaryContainer => _colorScheme.tertiaryContainer;
  Color get onTertiaryContainer => _colorScheme.onTertiaryContainer;

  Color get error => _colorScheme.error;
  Color get onError => _colorScheme.onError;
  Color get errorContainer => _colorScheme.errorContainer;
  Color get onErrorContainer => _colorScheme.onErrorContainer;

  Color get surface => _colorScheme.surface;
  Color get onSurface => _colorScheme.onSurface;
  Color get surfaceDim => _colorScheme.surfaceDim;
  Color get surfaceBright => _colorScheme.surfaceBright;
  Color get surfaceContainerLowest => _colorScheme.surfaceContainerLowest;
  Color get surfaceContainerLow => _colorScheme.surfaceContainerLow;
  Color get surfaceContainer => _colorScheme.surfaceContainer;
  Color get surfaceContainerHigh => _colorScheme.surfaceContainerHigh;
  Color get surfaceContainerHighest => _colorScheme.surfaceContainerHighest;

  Color get onSurfaceVariant => _colorScheme.onSurfaceVariant;
  Color get outline => _colorScheme.outline;
  Color get outlineVariant => _colorScheme.outlineVariant;
  Color get inverseSurface => _colorScheme.inverseSurface;
  Color get onInverseSurface => _colorScheme.onInverseSurface;
  Color get surfaceTint => _colorScheme.surfaceTint;

  /// Main body text — maps to [onSurface].
  Color get primaryText => _colorScheme.onSurface;

  /// Subtitles, captions, hints — maps to [onSurfaceVariant].
  Color get secondaryText => _colorScheme.onSurfaceVariant;

  /// Screen / scaffold background — maps to [surface].
  Color get background => _colorScheme.surface;

  /// Cards, sheets, elevated panels — maps to [surfaceContainer].
  Color get cardBackground => _colorScheme.surfaceContainer;

  /// Dividers and borders — maps to [outline].
  Color get border => _colorScheme.outline;

  /// Subtle dividers — maps to [outlineVariant].
  Color get borderVariant => _colorScheme.outlineVariant;

  bool get isDark => _colorScheme.brightness == Brightness.dark;
}

extension AppThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  AppThemeColors get colors => AppThemeColors(colorScheme);
}
