import 'package:flutter/material.dart';

import '../../../../app/config/color_scheme.dart';

class CheckboxSquare extends StatefulWidget {
  final void Function(bool?)? onChanged;
  const CheckboxSquare({
    super.key,
    this.onChanged,
  });

  @override
  State<CheckboxSquare> createState() => _CheckboxSquareState();
}

class _CheckboxSquareState extends State<CheckboxSquare> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      side: MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
        return BorderSide(color: baseScheme.background, width: 2);
      }),
      activeColor: baseScheme.onInverseSurface,
      checkColor: baseScheme.background,
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          widget.onChanged?.call(isChecked);
        });
      },
      visualDensity: VisualDensity.compact,
    );
  }
}
