import 'package:flutter/material.dart';

import '../../../app/config/color_scheme.dart';

class CommonCard extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? boxShadow;
  final BorderRadius? borderRadius;
  final Alignment? alignment;
  final bool hasBorder;

  const CommonCard({
    super.key,
    this.backgroundColor,
    this.child,
    this.boxShadow,
    this.borderRadius,
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    this.alignment,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? baseScheme.background,
        border: hasBorder
            ? Border.all(
                width: 1,
                color: baseScheme.outline,
              )
            : null,
        boxShadow: boxShadow ??
            const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, .15),
                spreadRadius: 8,
                blurRadius: 20,
                offset: Offset(0, 3),
              ),
            ],
        borderRadius: borderRadius ??
            const BorderRadius.all(
              Radius.circular(10),
            ),
      ),
      padding: padding,
      alignment: alignment,
      child: child,
    );
  }
}
