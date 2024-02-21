import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/config/color_scheme.dart';
import '../../../app/tools/mixins/facade.dart';
import '../../components/assets/png.dart';
import '../../components/button/full_width_button.dart';
import '../../components/text.dart';
import '../login/interface.dart';
import 'presenter.dart';
import 'views/facebook.dart';
import 'views/linkedin.dart';
import 'views/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ILogin<LoginScreen> with Facade {
  final _presenter = LoginPresenter();

  @override
  void initState() {
    super.initState();
    _presenter.checkFaceId();
  }

  @override
  Widget build(BuildContext context) {
    double heigthScreen = Get.mediaQuery.size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: baseScheme.background,
      body: SingleChildScrollView(
        child: Container(
          color: baseScheme.onInverseSurface,
          height: heigthScreen,
          child: Stack(
            children: [
              const Positioned(
                top: 45,
                left: 0,
                right: 0,
                child: Center(child: PngAsset.google()),
              ),
              const Positioned(
                top: 65,
                left: 0,
                right: 0,
                child: PngAsset.faceSignin(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 170),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: baseScheme.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                  ),
                  gradient: const RadialGradient(
                    center: Alignment.bottomLeft,
                    radius: 1.3693,
                    stops: [0.0, 1.0],
                    colors: [
                      Color(0xFFDDEBF6),
                      Color(0xFFFFFFFF),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: facade(),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FullWidthButton(
                            onPressed: () async {
                              setLoadingEvent();
                              await _presenter.onPressedLogin(
                                onComplete: completeLoadingEvent,
                              );
                            },
                            buttonText: 'Login',
                          ),
                          Obx(() {
                            if (_presenter.isFaceId.value) {
                              return InkWell(
                                onTap: () {
                                  _presenter.onInitAuthentication(
                                    setLoadingEvent,
                                    completeLoadingEvent,
                                  );
                                },
                                child: Container(
                                  height: heigthScreen < 700 ? 31 : 61,
                                  width: heigthScreen < 700 ? 31 : 61,
                                  padding: Platform.isIOS
                                      ? EdgeInsets.zero
                                      : const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: baseScheme.background,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Platform.isIOS
                                      ? PngAsset.faceSignin(
                                          width: heigthScreen < 700 ? 27 : 47,
                                          height: heigthScreen < 700 ? 27 : 47,
                                        )
                                      : PngAsset.fingerprint(
                                          width: heigthScreen < 700 ? 27 : 47,
                                          height: heigthScreen < 700 ? 27 : 47,
                                        ),
                                ),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          }),
                          Text.rich(
                            TextSpan(
                              text: 'Don’t Have an Account? ',
                              children: [
                                WidgetSpan(
                                  child: InkWell(
                                    onTap: () {
                                      //Pages.toSignup();
                                    },
                                    child: InterText.bodyRegular(
                                      'Sign Up',
                                      color: baseScheme.primaryContainer,
                                    ).copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              color: baseScheme.surfaceTint,
                            ),
                          ),
                          const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget get initialState => LoginMain(
        onAuthenticateBiometrics: () {
          _presenter.onInitAuthentication(
            setLoadingEvent,
            completeLoadingEvent,
          );
        },
        usernameController: _presenter.usernameController,
        passwordController: _presenter.passwordController,
        onForgotPassword: () async {
          setLoadingEvent();
          try {
            //await _presenter.getCurrentCountry();
            completeLoadingEvent();
            //Pages.toForgotPassword();
          } catch (e) {
            completeLoadingEvent();
            // showSnackBar(
            //   title: unexpectedError,
            // );
          }
        },
        isRememberMe: _presenter.isRememberMe,
        toggleIsRememberMe: _presenter.toggleIsRememberMe,
      );

  @override
  Widget get facebook => LoginFacebook(
        onTap: () {},
      );

  @override
  Widget get linkedin => LoginLinkedIn(
        onTap: () {},
      );
}
