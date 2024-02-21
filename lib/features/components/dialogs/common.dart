import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/config/color_scheme.dart';
import '../assets/svg.dart';
import '../text.dart';

class CommonDialog extends StatelessWidget {
  final String title;
  final SvgAsset? svgAsset;
  final String bodyMessage;
  final void Function()? onClose;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? paddingBodyMessage;

  const CommonDialog({
    super.key,
    this.title = 'Notification',
    this.bodyMessage = '',
    this.svgAsset,
    this.onClose,
    this.borderRadius,
    this.paddingBodyMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            borderRadius ?? const BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(10)),
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 4,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: svgAsset ?? const SvgAsset.tickApproved(),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: onClose ?? () => Get.close(0),
                    child: Icon(
                      Icons.close,
                      color: baseScheme.background,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: FittedBox(
                child: InterText.h2(
                  title,
                  color: baseScheme.background,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              height: 1,
              width: 89,
              color: baseScheme.background,
            ),
            Padding(
              padding: paddingBodyMessage ??
                  const EdgeInsets.only(left: 40, right: 40, bottom: 14),
              child: InterText.bodyMedium(
                bodyMessage,
                color: baseScheme.background,
              ).copyWith(
                textAlign: TextAlign.center,
                height: 1.5,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
