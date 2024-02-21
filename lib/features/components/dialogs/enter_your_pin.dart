import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../app/config/color_scheme.dart';
import '../assets/png.dart';
import '../button/fixed_width_button.dart';
import '../input/input_text/custom_text_field.dart';
import '../text.dart';

class EnterYourPinDialog extends StatefulWidget {
  final void Function() onClose;
  final void Function() onPressedCancel;
  final void Function() onPressedSubmit;
  final TextEditingController digitOnePinController;
  final TextEditingController digitTwoPinController;
  final TextEditingController digitThreePinController;
  final TextEditingController digitFourPinController;
  final FocusNode digitOneFocusNode;
  final FocusNode digitTwoFocusNode;
  final FocusNode digitThreeFocusNode;
  final FocusNode digitFourFocusNode;

  const EnterYourPinDialog({
    super.key,
    required this.onClose,
    required this.onPressedCancel,
    required this.onPressedSubmit,
    required this.digitOnePinController,
    required this.digitTwoPinController,
    required this.digitThreePinController,
    required this.digitFourPinController,
    required this.digitOneFocusNode,
    required this.digitTwoFocusNode,
    required this.digitThreeFocusNode,
    required this.digitFourFocusNode,
  });

  @override
  State<EnterYourPinDialog> createState() => _EnterYourPinDialogState();
}

class _EnterYourPinDialogState extends State<EnterYourPinDialog> {
  final String title = 'Pin';

  bool isDigitsComplete = false;

  @override
  void initState() {
    super.initState();
    updateDigitsComplete();
  }

  void updateDigitsComplete() {
    setState(() {
      isDigitsComplete = (widget.digitOnePinController.text.isNotEmpty &&
          widget.digitTwoPinController.text.isNotEmpty &&
          widget.digitThreePinController.text.isNotEmpty &&
          widget.digitFourPinController.text.isNotEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> textInputFormat = [
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      LengthLimitingTextInputFormatter(1),
    ];
    double deviceWidth = Get.mediaQuery.size.width;
    return SingleChildScrollView(
      child: SizedBox(
        height: Get.mediaQuery.size.height,
        child: Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                colors: [
                  baseScheme.onInverseSurface,
                  baseScheme.onSurfaceVariant,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.1061, 0.8939],
                transform: const GradientRotation(7 * 3.1416 / 180),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: widget.onClose,
                      child: Icon(
                        Icons.close,
                        color: baseScheme.background,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PngAsset.tick(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: InterText.h2(
                    title,
                    color: baseScheme.background,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 15),
                  height: 1,
                  width: 89,
                  color: baseScheme.background,
                ),
                InterText.bodyMedium(
                  'Enter your 4 digit pin',
                  color: baseScheme.background,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: deviceWidth < 400 ? 10 : 40,
                    vertical: 14,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        controller: widget.digitOnePinController,
                        width: 45,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                        inputFormatters: textInputFormat,
                        fillColor: baseScheme.background.withOpacity(0.2),
                        textAlignVertical: TextAlignVertical.center,
                        fontSize: 26,
                        focusNode: widget.digitOneFocusNode,
                        textInputType: TextInputType.number,
                        cursorColor: baseScheme.background,
                        contentPading: const EdgeInsets.symmetric(vertical: 10),
                        textColor: baseScheme.background,
                        onChanged: (p0) {
                          if (p0.isNotEmpty) {
                            widget.digitTwoFocusNode.requestFocus();
                          }
                          updateDigitsComplete();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CustomTextField(
                          controller: widget.digitTwoPinController,
                          width: 45,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.bold,
                          inputFormatters: textInputFormat,
                          fillColor: baseScheme.background.withOpacity(0.2),
                          textAlignVertical: TextAlignVertical.center,
                          fontSize: 26,
                          focusNode: widget.digitTwoFocusNode,
                          textInputType: TextInputType.number,
                          textColor: baseScheme.background,
                          cursorColor: baseScheme.background,
                          contentPading:
                              const EdgeInsets.symmetric(vertical: 10),
                          onChanged: (p0) {
                            if (p0.isNotEmpty) {
                              widget.digitThreeFocusNode.requestFocus();
                            }
                            updateDigitsComplete();
                          },
                        ),
                      ),
                      CustomTextField(
                        controller: widget.digitThreePinController,
                        width: 45,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                        inputFormatters: textInputFormat,
                        fillColor: baseScheme.background.withOpacity(0.2),
                        textAlignVertical: TextAlignVertical.center,
                        fontSize: 26,
                        focusNode: widget.digitThreeFocusNode,
                        textInputType: TextInputType.number,
                        contentPading: const EdgeInsets.symmetric(vertical: 10),
                        textColor: baseScheme.background,
                        cursorColor: baseScheme.background,
                        onChanged: (p0) {
                          if (p0.isNotEmpty) {
                            widget.digitFourFocusNode.requestFocus();
                          }
                          updateDigitsComplete();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CustomTextField(
                          controller: widget.digitFourPinController,
                          width: 45,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.bold,
                          inputFormatters: textInputFormat,
                          fillColor: baseScheme.background.withOpacity(0.2),
                          textAlignVertical: TextAlignVertical.center,
                          fontSize: 26,
                          focusNode: widget.digitFourFocusNode,
                          textInputType: TextInputType.number,
                          textColor: baseScheme.background,
                          cursorColor: baseScheme.background,
                          contentPading:
                              const EdgeInsets.symmetric(vertical: 10),
                          onChanged: (p0) {
                            if (p0.isNotEmpty) {
                              widget.digitFourFocusNode.unfocus();
                            }
                            updateDigitsComplete();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 15,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FixedWidthButton(
                        buttonText: 'Cancel',
                        borderColor: baseScheme.background,
                        onPressed: widget.onPressedCancel,
                        buttonHeigth: 50,
                        fixedWidth: 127,
                        fontWeightText: FontWeight.normal,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      FixedWidthButton(
                        buttonText: 'Submit',
                        backgroundColor: baseScheme.background,
                        textColor: isDigitsComplete
                            ? baseScheme.onInverseSurface
                            : baseScheme.outline,
                        onPressed:
                            isDigitsComplete ? widget.onPressedSubmit : null,
                        buttonHeigth: 50,
                        borderColor:
                            isDigitsComplete ? null : baseScheme.outline,
                        fixedWidth: 127,
                        fontWeightText: FontWeight.normal,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
