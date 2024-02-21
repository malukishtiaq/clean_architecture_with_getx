import 'package:flutter/cupertino.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.onChange,
    this.alignment,
    this.value,
    this.width,
    this.height,
    this.margin,
  });

  final Alignment? alignment;
  final bool? value;
  final Function(bool) onChange;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: alignment != null
          ? Align(
              alignment: alignment ?? Alignment.center,
              child: CupertinoSwitch(
                value: value ?? false,
                onChanged: (value) {
                  onChange(value);
                },
              ),
            )
          : CupertinoSwitch(
              value: value ?? false,
              onChanged: (value) {
                onChange(value);
              },
            ),
    );
  }
}
