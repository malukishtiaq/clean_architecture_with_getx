import 'package:flutter/material.dart';

import '../../../app/config/color_scheme.dart';
import '../text.dart';

class FullWidthButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool isFullFill;
  final bool hasBorder;
  final String? buttonText;
  final Widget? children;
  final EdgeInsetsGeometry? padding;
  final bool isDisabled;
  final Color? borderColor;

  const FullWidthButton({
    super.key,
    this.onPressed,
    this.buttonText,
    this.isFullFill = true,
    this.hasBorder = true,
    this.children,
    this.padding,
    this.isDisabled = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 171),
      decoration: borderColor != null
          ? BoxDecoration(
              border: Border.all(
                color: borderColor!,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            )
          : null,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isFullFill ? baseScheme.onInverseSurface : baseScheme.background,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            side: switch (isFullFill) {
              true => BorderSide.none,
              false => hasBorder
                  ? BorderSide(
                      color: baseScheme.onInverseSurface,
                      width: 1,
                    )
                  : BorderSide.none
            },
          ),
          foregroundColor: baseScheme.onInverseSurface,
          disabledBackgroundColor: isFullFill
              ? baseScheme.onInverseSurface.withOpacity(0.5)
              : baseScheme.background.withOpacity(0.5),
        ),
        onPressed: !isDisabled ? onPressed : null,
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              children ??
                  InterText.subtitle(
                    buttonText ?? '',
                    color: isFullFill
                        ? baseScheme.background
                        : baseScheme.onInverseSurface,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
