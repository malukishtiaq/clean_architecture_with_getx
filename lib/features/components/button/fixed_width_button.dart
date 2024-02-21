import 'package:flutter/material.dart';

import '../../../app/config/color_scheme.dart';
import '../text.dart';

class FixedWidthButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? buttonText;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? fixedWidth;
  final double? buttonHeigth;
  final FontWeight? fontWeightText;
  final double? fontSizeText;

  const FixedWidthButton({
    super.key,
    required this.onPressed,
    this.buttonText,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.fixedWidth,
    this.buttonHeigth,
    this.fontWeightText,
    this.fontSizeText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
        color: backgroundColor ?? baseScheme.onInverseSurface,
      ),
      width: fixedWidth ?? 127,
      height: buttonHeigth ?? 45,
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: InterText.subtitle(
            buttonText ?? '',
            color: textColor ?? baseScheme.background,
          ).copyWith(
            fontWeight: fontWeightText ?? FontWeight.w700,
            fontSize: fontSizeText,
          ),
        ),
      ),
    );
  }
}
