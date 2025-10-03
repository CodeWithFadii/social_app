import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle _get(
    BuildContext context,
    TextStyle? style, {
    FontWeight? weight,
    Color? color,
    double? fontSize,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    if (style == null) return const TextStyle();
    return style.copyWith(
      fontWeight: weight,
      color: color,
      fontSize: fontSize,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
      decorationColor: color,
    );
  }

  // Display
  static TextStyle boldPrimary(
    BuildContext context, {
    FontWeight? weight,
    Color? color,
    double? fontSize,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) => _get(
    context,
    Theme.of(context).textTheme.displayLarge,
    weight: weight,
    color: color,
    fontSize: fontSize,
    height: height,
    letterSpacing: letterSpacing,
    decoration: decoration,
  );

  // Headline
  static TextStyle semiBoldPrimary(
    BuildContext context, {
    FontWeight? weight,
    Color? color,
    double? fontSize,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) => _get(
    context,
    Theme.of(context).textTheme.headlineLarge,
    weight: weight,
    color: color,
    fontSize: fontSize,
    height: height,
    letterSpacing: letterSpacing,
    decoration: decoration,
  );

  static TextStyle mediumPrimary(
    BuildContext context, {
    FontWeight? weight,
    Color? color,
    double? fontSize,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) => _get(
    context,
    Theme.of(context).textTheme.titleMedium,
    weight: weight,
    color: color,
    fontSize: fontSize,
    height: height,
    letterSpacing: letterSpacing,
    decoration: decoration,
  );

  static TextStyle regularPrimary(
    BuildContext context, {
    FontWeight? weight,
    Color? color,
    double? fontSize,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) => _get(
    context,
    Theme.of(context).textTheme.bodySmall,
    weight: weight,
    color: color,
    fontSize: fontSize,
    height: height,
    letterSpacing: letterSpacing,
    decoration: decoration,
  );

  static TextStyle regularSecondary(
    BuildContext context, {
    FontWeight? weight,
    Color? color,
    double? fontSize,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) => _get(
    context,
    Theme.of(context).textTheme.labelSmall,
    weight: weight,
    color: color,
    fontSize: fontSize,
    height: height,
    letterSpacing: letterSpacing,
    decoration: decoration,
  );
}
