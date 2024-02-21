import 'package:flutter/material.dart';

import '../../../app/config/color_scheme.dart';
import '../assets/png.dart';
import '../assets/svg.dart';
import '../text.dart';
import 'common_card.dart';

class CardVerify extends StatelessWidget {
  final String verifyName;
  final String verifyDescription;
  final bool isVerified;
  final PngAsset icon;

  const CardVerify({
    super.key,
    required this.verifyName,
    required this.verifyDescription,
    required this.isVerified,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  InterText.bodyRegular(
                    verifyName,
                    color: baseScheme.onInverseSurface,
                  ).copyWith(fontWeight: FontWeight.w700),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InterText.bodyMedium(
                      verifyDescription,
                      color: baseScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  icon,
                  const PngAsset.faceSignin(
                    width: 60,
                    height: 10,
                  ),
                ],
              ),
              if (isVerified)
                const SvgAsset.verified()
              else
                Container(
                  height: 17.5,
                  width: 17,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: baseScheme.surfaceTint.withOpacity(.5),
                      width: 1.5,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
