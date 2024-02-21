import 'package:flutter/material.dart';

import '../../../components/assets/png.dart';

class LoginFacebook extends StatelessWidget {
  final void Function() onTap;

  const LoginFacebook({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const String socialType = 'Facebook';
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (socialType == 'Facebook')
          const PngAsset.facebook(width: 72, height: 72),
        if (socialType == 'Google')
          const PngAsset.google(width: 72, height: 72),
        if (socialType == 'Linkedin')
          const PngAsset.linkedin(width: 72, height: 72),
        const Center(
          child: Text(
            'Welcome',
            style: TextStyle(
              color: Color(0xFF0572D2),
              fontSize: 26,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Text(
          getLoginWithText(),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: Color(0xFF474A54)),
        ),
        Container(
          height: 3,
          width: 57,
          color: const Color(0xFF06B576),
        ),
      ],
    );
  }

  String getLoginWithText() {
    const String socialType = 'Facebook';
    if (socialType == 'Facebook') {
      return 'Click Login Button Below to \nLogin with Facebook';
    } else if (socialType == 'Google') {
      return 'Click Login Button Below to \nLogin with Google';
    } else if (socialType == 'Linkedin') {
      return 'Click Login Button Below to \nLogin with LinkedIn';
    } else {
      return 'Click Login Button Below to Login';
    }
  }
}
