import 'package:flutter/material.dart';

import '../../../../app/config/color_scheme.dart';

class CustomCheckbox extends StatefulWidget {
  final void Function() toggleIsChecked;
  final bool currentSelection;
  const CustomCheckbox({
    super.key,
    required this.toggleIsChecked,
    required this.currentSelection,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool? _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.currentSelection;
  }

  @override
  void didUpdateWidget(CustomCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (mounted && _isChecked != widget.currentSelection) {
      setState(() {
        _isChecked = widget.currentSelection;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return baseScheme.onInverseSurface;
      }
      return baseScheme.inverseSurface;
    }

    return Transform.scale(
      scale: 1.0,
      child: Checkbox(
        value: _isChecked ?? false,
        activeColor: baseScheme.onInverseSurface,
        checkColor: baseScheme.onInverseSurface,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(2.0),
          ),
        ),
        side: MaterialStateBorderSide.resolveWith(
          (states) => BorderSide(
            width: 2,
            color: baseScheme.onInverseSurface,
          ),
        ),
        onChanged: (bool? value) {
          setState(
            () {
              if (value != null) {
                _isChecked = value;
                widget.toggleIsChecked();
              }
            },
          );
        },
      ),
    );
  }
}
