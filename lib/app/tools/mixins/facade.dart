import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../interface/facade_interface.dart';

typedef Overlay = void Function();

mixin Facade on FacadeInterface {
  final StreamController<Widget> controller = StreamController();

  ///Controls how many Dialogs are open
  static final List<Overlay> _openDialogs = [];

  ///Controls how many Loadings are open
  static final List<Overlay> _openLoadings = [];

  Widget facade() => StreamBuilder<Widget>(
        stream: controller.stream,
        builder: (_, snapshot) {
          if (!snapshot.hasData) return initialState;

          return snapshot.requireData;
        },
      );

  void setFacade(FacadeState eventFacade) {
    controller.add(eventFacade);
  }

  void setDialogEvent(
    Widget child, {
    bool dismissible = false,
    EdgeInsets? padding,
    double? paddingScaleFactor,
  }) {
    _openDialogs.add(_overlay);

    showGeneralDialog(
      context: Get.context!,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container(
          padding: padding ??
              (Get.mediaQuery.viewInsets / (paddingScaleFactor ?? 1)),
          child: child,
        );
      },
      barrierColor: Colors.black.withOpacity(0.75),
      barrierDismissible: dismissible,
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 250),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final scaleMinValue =
            animation.status == AnimationStatus.reverse ? .8 : .65;

        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeIn,
            reverseCurve: Curves.easeIn,
          ),
          child: Transform.scale(
            scale: scaleMinValue + ((1 - scaleMinValue) * animation.value),
            child: child,
          ),
        );
      },
    ).then((_) => _openDialogs.removeLast());
  }

  ///Method for closing last open Dialogs
  void closeDialogEvent() {
    if (_openDialogs.isNotEmpty) {
      _openDialogs.last();
    }
  }

  /// Method for setting full page loading progress
  void setLoadingEvent() {
    _openLoadings.add(_overlay);

    Get.dialog(
      const PopScope(
        canPop: false,
        child: Dialog(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 8),
                Text('Loading...'),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void completeLoadingEvent() {
    if (_openLoadings.isNotEmpty && Get.isDialogOpen == true) {
      _openLoadings.last();
    }
  }

  @protected
  static void facadeHandlerReset() {
    _openDialogs.clear();
  }

  @protected
  void Function() get _overlay => () => Get.close(0);
}
