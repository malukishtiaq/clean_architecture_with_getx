import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app/config/color_scheme.dart';
import '../../assets/svg.dart';

enum InputType {
  Password,
  Address,
  Search,
}

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? hintText;
  final bool isPassword;
  final bool isReadOnly;
  final Color? fillColor;
  final double height;
  final double? width;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final List<TextInputFormatter>? inputFormatters;
  final InputType? inputType;
  final TextStyle? textStyle;
  final void Function()? onTapIcon;
  final void Function()? onTapClearIcon;
  final bool isClearable;
  final void Function(String)? onChanged;
  final TextAlignVertical textAlignVertical;
  final double fontSize;
  final TextInputType? textInputType;
  final EdgeInsetsGeometry? contentPading;
  final Color? textColor;
  final Color? cursorColor;

  const CustomTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.hintText,
    this.isPassword = false,
    this.isReadOnly = false,
    this.fillColor,
    this.height = 45,
    this.width = double.infinity,
    this.textAlign = TextAlign.left,
    this.fontWeight = FontWeight.w400,
    this.inputFormatters,
    this.inputType,
    this.textStyle,
    this.onTapIcon,
    this.onTapClearIcon,
    this.onChanged,
    this.textAlignVertical = TextAlignVertical.bottom,
    this.fontSize = 14,
    this.textInputType,
    this.contentPading,
    this.textColor,
    this.cursorColor,
    this.isClearable = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;
  FocusNode? node;

  @override
  void initState() {
    super.initState();
    node = widget.focusNode ?? FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextField(
        onSubmitted: (value) {},
        readOnly: widget.isReadOnly,
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        style: widget.textStyle ??
            TextStyle(
              fontFamily: 'Inter',
              fontWeight: widget.fontWeight,
              fontSize: widget.fontSize,
              color: widget.textColor,
            ),
        focusNode: node,
        obscureText: widget.isPassword ? obscureText : false,
        onTapOutside: (event) {
          node?.unfocus();
        },
        onChanged: widget.onChanged,
        textAlign: widget.textAlign,
        cursorColor: widget.cursorColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          filled: true,
          fillColor: widget.fillColor ?? baseScheme.background,
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 1, color: baseScheme.scrim),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 1, color: baseScheme.scrim),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 1, color: baseScheme.scrim),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 1, color: baseScheme.scrim),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 1, color: baseScheme.scrim),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey[500],
            height: 17 / 14,
          ),
          suffixIcon: (widget.controller.text.isNotEmpty &&
                  !widget.isReadOnly &&
                  widget.isClearable)
              ? InkWell(
                  onTap: widget.onTapClearIcon,
                  child: const Icon(Icons.clear_outlined),
                )
              : widget.inputType == InputType.Password
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: obscureText
                          ? Icon(
                              Icons.visibility_off,
                              color: baseScheme.surfaceTint,
                            )
                          : Icon(
                              Icons.visibility,
                              color: baseScheme.surfaceTint,
                            ),
                    )
                  : widget.inputType == InputType.Address
                      ? InkWell(
                          onTap: widget.onTapIcon,
                          child: Transform.scale(
                            scale: 0.6,
                            child: const SvgAsset.googleMaps(),
                          ),
                        )
                      : null,
          prefixIcon: widget.inputType == InputType.Search
              ? Icon(
                  Icons.search,
                  size: 30,
                  color: baseScheme.outlineVariant,
                )
              : null,
        ),
        keyboardType: widget.textInputType,
      ),
    );
  }
}
