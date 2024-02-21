import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum InterSizes {
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  subtitle,
  bodyRegular,
  bodyMedium,
  button,
  custom,
}

class InterText extends Text {
  final InterSizes _interSize;
  final Color? color;

  const InterText._(
    super.data,
    this._interSize, {
    super.style,
    super.maxLines,
    super.textAlign,
    super.softWrap,
  }) : color = null;

  /// Font size 48
  const InterText.h1(super.data, {super.key, this.color})
      : _interSize = InterSizes.headline1;

  /// Font size 40
  const InterText.h2(super.data, {super.key, this.color})
      : _interSize = InterSizes.headline2;

  /// Font size 28
  const InterText.h3(super.data, {super.key, this.color})
      : _interSize = InterSizes.headline3;

  /// Font size 26
  const InterText.h4(super.data, {super.key, this.color})
      : _interSize = InterSizes.headline4;

  /// Font size 24
  const InterText.h5(super.data, {super.key, this.color})
      : _interSize = InterSizes.headline5;

  /// Font size 22
  const InterText.h6(super.data, {super.key, this.color})
      : _interSize = InterSizes.headline6;

  /// Font size 20
  const InterText.subtitle(super.data, {super.key, this.color})
      : _interSize = InterSizes.subtitle;

  /// Font size 16
  const InterText.bodyRegular(super.data, {super.key, this.color})
      : _interSize = InterSizes.bodyMedium;

  /// Font size  14
  const InterText.bodyMedium(super.data, {super.key, this.color})
      : _interSize = InterSizes.bodyRegular;

  /// Font size 12
  const InterText.button(super.data, {super.key, this.color})
      : _interSize = InterSizes.button;

  @override
  TextStyle? get style => switch (_interSize) {
        ///Font size 48
        InterSizes.headline1 =>
          Get.textTheme.displayLarge?.copyWith(color: color),

        ///Font size 40
        InterSizes.headline2 =>
          Get.textTheme.displayMedium?.copyWith(color: color),

        ///Font size 28
        InterSizes.headline3 =>
          Get.textTheme.displaySmall?.copyWith(color: color),

        ///Font size 26
        InterSizes.headline4 =>
          Get.textTheme.headlineMedium?.copyWith(color: color),

        ///Font size 24
        InterSizes.headline5 =>
          Get.textTheme.headlineSmall?.copyWith(color: color),

        ///Font size 22
        InterSizes.headline6 =>
          Get.textTheme.titleLarge?.copyWith(color: color),

        ///Font size 20
        InterSizes.subtitle =>
          Get.textTheme.titleMedium?.copyWith(color: color),

        ///Font size 16
        InterSizes.bodyMedium =>
          Get.textTheme.titleSmall?.copyWith(color: color),

        ///Font size 14
        InterSizes.bodyRegular =>
          Get.textTheme.labelLarge?.copyWith(color: color),

        ///Font size 12
        InterSizes.button => Get.textTheme.bodyLarge?.copyWith(color: color),
        InterSizes.custom => super.style,
      };

  InterText copyWith({
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    TextOverflow? overflow,
    int? maxLines,
    TextAlign? textAlign,
    bool? softWrap,
  }) {
    return InterText._(
      data ?? '',
      InterSizes.custom,
      style: style?.copyWith(
        color: color ?? super.style?.color,
        backgroundColor: backgroundColor ?? super.style?.backgroundColor,
        fontSize: fontSize ?? super.style?.fontSize,
        fontWeight: fontWeight ?? super.style?.fontWeight,
        fontStyle: fontStyle ?? super.style?.fontStyle,
        letterSpacing: letterSpacing ?? super.style?.letterSpacing,
        wordSpacing: wordSpacing ?? super.style?.wordSpacing,
        height: height ?? super.style?.height,
        decoration: decoration ?? super.style?.decoration,
        decorationColor: decorationColor ?? super.style?.decorationColor,
        decorationStyle: decorationStyle ?? super.style?.decorationStyle,
        decorationThickness:
            decorationThickness ?? super.style?.decorationThickness,
        overflow: overflow ?? super.style?.overflow,
      ),
      maxLines: maxLines ?? super.maxLines,
      softWrap: softWrap ?? super.softWrap,
      textAlign: textAlign ?? super.textAlign,
    );
  }
}
