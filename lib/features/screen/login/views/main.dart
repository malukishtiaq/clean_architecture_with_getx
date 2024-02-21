import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/config/color_scheme.dart';
import '../../../components/assets/png.dart';
import '../../../components/input/check_box/check_box.dart';
import '../../../components/input/input_text/custom_text_field.dart';
import '../../../components/text.dart';

class LoginMain extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final void Function()? onForgotPassword;
  final void Function() toggleIsRememberMe;
  final void Function() onAuthenticateBiometrics;
  final Rx<bool> isRememberMe;

  const LoginMain({
    super.key,
    required this.usernameController,
    required this.passwordController,
    this.onForgotPassword,
    required this.isRememberMe,
    required this.toggleIsRememberMe,
    required this.onAuthenticateBiometrics,
  });

  @override
  State<LoginMain> createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (Get.previousRoute.isEmpty) {
        widget.onAuthenticateBiometrics();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double heigthScreen = Get.mediaQuery.size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            SizedBox(
              height: heigthScreen < 700 ? 180 : 214,
              child: FittedBox(
                child: Column(
                  children: [
                    const PngAsset.google(),
                    Padding(
                      padding: const EdgeInsets.only(top: 22, bottom: 6),
                      child: InterText.h4(
                        'Welcome',
                        color: baseScheme.onInverseSurface,
                      ),
                    ),
                    InterText.bodyRegular(
                      'Click Login Button Below to\n Login with your eMail',
                      color: baseScheme.surfaceTint,
                    ).copyWith(textAlign: TextAlign.center),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 27),
                      height: 3,
                      width: 57,
                      color: baseScheme.primaryContainer,
                    ),
                  ],
                ),
              ),
            ),
            CustomTextField(
              controller: widget.usernameController,
              hintText: 'Username, Email or Phone',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: CustomTextField(
                controller: widget.passwordController,
                hintText: 'Password',
                isPassword: true,
                inputType: InputType.Password,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                      child: Obx(
                        () => CustomCheckbox(
                          currentSelection: widget.isRememberMe.value,
                          toggleIsChecked: widget.toggleIsRememberMe,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: InterText.bodyMedium(
                        'Remember Me',
                        color: baseScheme.shadow,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: widget.onForgotPassword,
                  child: InterText.bodyRegular(
                    'Forgot password',
                    color: baseScheme.primaryContainer,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
