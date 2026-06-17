import 'package:flutter/material.dart';
import 'package:ticket_app/core/constants/app_colors.dart';

abstract class AppTheme {
  static ThemeData light() {
    return ThemeData.light(useMaterial3: true).copyWith(
      colorScheme: _lightColorScheme,
    );
  }

  static ThemeData dark() {
    return ThemeData.dark(useMaterial3: true).copyWith(
      colorScheme: _darkColorScheme,
    );
  }

  static ColorScheme get _lightColorScheme {
    return ColorScheme.fromSeed(
      seedColor: AppColorsLight.primary,
      brightness: Brightness.light,
    ).copyWith(
      primary: AppColorsLight.primary,
      onPrimary: AppColorsLight.onPrimary,
      primaryContainer: AppColorsLight.primaryContainer,
      onPrimaryContainer: AppColorsLight.onPrimaryContainer,
      inversePrimary: AppColorsLight.inversePrimary,
      secondary: AppColorsLight.secondary,
      onSecondary: AppColorsLight.onSecondary,
      secondaryContainer: AppColorsLight.secondaryContainer,
      onSecondaryContainer: AppColorsLight.onSecondaryContainer,
      tertiary: AppColorsLight.tertiary,
      onTertiary: AppColorsLight.onTertiary,
      tertiaryContainer: AppColorsLight.tertiaryContainer,
      onTertiaryContainer: AppColorsLight.onTertiaryContainer,
      error: AppColorsLight.error,
      onError: AppColorsLight.onError,
      errorContainer: AppColorsLight.errorContainer,
      onErrorContainer: AppColorsLight.onErrorContainer,
      surface: AppColorsLight.surface,
      onSurface: AppColorsLight.onSurface,
      onSurfaceVariant: AppColorsLight.onSurfaceVariant,
      outline: AppColorsLight.outline,
      outlineVariant: AppColorsLight.outlineVariant,
      inverseSurface: AppColorsLight.inverseSurface,
      onInverseSurface: AppColorsLight.inverseOnSurface,
      surfaceTint: AppColorsLight.surfaceTint,
      surfaceDim: AppColorsLight.surfaceDim,
      surfaceBright: AppColorsLight.surfaceBright,
      surfaceContainerLowest: AppColorsLight.surfaceContainerLowest,
      surfaceContainerLow: AppColorsLight.surfaceContainerLow,
      surfaceContainer: AppColorsLight.surfaceContainer,
      surfaceContainerHigh: AppColorsLight.surfaceContainerHigh,
      surfaceContainerHighest: AppColorsLight.surfaceContainerHighest,
    );
  }

  static ColorScheme get _darkColorScheme {
    return ColorScheme.fromSeed(
      seedColor: AppColorsDark.primary,
      brightness: Brightness.dark,
    ).copyWith(
      primary: AppColorsDark.primary,
      onPrimary: AppColorsDark.onPrimary,
      primaryContainer: AppColorsDark.primaryContainer,
      onPrimaryContainer: AppColorsDark.onPrimaryContainer,
      inversePrimary: AppColorsDark.inversePrimary,
      secondary: AppColorsDark.secondary,
      onSecondary: AppColorsDark.onSecondary,
      secondaryContainer: AppColorsDark.secondaryContainer,
      onSecondaryContainer: AppColorsDark.onSecondaryContainer,
      tertiary: AppColorsDark.tertiary,
      onTertiary: AppColorsDark.onTertiary,
      tertiaryContainer: AppColorsDark.tertiaryContainer,
      onTertiaryContainer: AppColorsDark.onTertiaryContainer,
      error: AppColorsDark.error,
      onError: AppColorsDark.onError,
      errorContainer: AppColorsDark.errorContainer,
      onErrorContainer: AppColorsDark.onErrorContainer,
      surface: AppColorsDark.surface,
      onSurface: AppColorsDark.onSurface,
      onSurfaceVariant: AppColorsDark.onSurfaceVariant,
      outline: AppColorsDark.outline,
      outlineVariant: AppColorsDark.outlineVariant,
      inverseSurface: AppColorsDark.inverseSurface,
      onInverseSurface: AppColorsDark.inverseOnSurface,
      surfaceTint: AppColorsDark.surfaceTint,
      surfaceDim: AppColorsDark.surfaceDim,
      surfaceBright: AppColorsDark.surfaceBright,
      surfaceContainerLowest: AppColorsDark.surfaceContainerLowest,
      surfaceContainerLow: AppColorsDark.surfaceContainerLow,
      surfaceContainer: AppColorsDark.surfaceContainer,
      surfaceContainerHigh: AppColorsDark.surfaceContainerHigh,
      surfaceContainerHighest: AppColorsDark.surfaceContainerHighest,
    );
  }
}
