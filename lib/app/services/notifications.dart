import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:universal_html/js.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../../domain/repositories/mixins/members.dart';
import '../constants/keys/firebase.dart';
import '../tools/routes.dart';
import 'members/device/save.dart';

class NotificationsService extends GetxController with MembersMixin {
  factory NotificationsService() {
    if (Get.isRegistered<NotificationsService>()) {
      return Get.find<NotificationsService>();
    } else {
      return Get.put(NotificationsService._());
    }
  }

  NotificationsService._();

  final _saveService = SaveService();
  final _deviceInfo = DeviceInfoPlugin();
  Map<String, dynamic>? _dataEvent;

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> registerDevice() async {
    ///Permissions
    final notificationSettings = await _messaging.requestPermission();

    if (notificationSettings.authorizationStatus !=
        AuthorizationStatus.authorized) {
      await saveSettings(settingsNotifications: false);
      return;
    }

    if (kIsWeb) {
      await _messaging.deleteToken();
    }

    final token = await _messaging.getToken(
      vapidKey: kIsWeb ? firebaseWebVApiKeyGetToken : null,
    );

    await saveSettings(settingsNotifications: true);

    final String _platformDevice = switch (defaultTargetPlatform) {
      TargetPlatform.iOS => 'IOS',
      TargetPlatform.android => 'Android',
      _ => 'Web'
    };

    String _modelNameDevice = '';
    String _osVersionDevice = '';

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
        _osVersionDevice = androidInfo.version.release;
        _modelNameDevice = '${androidInfo.manufacturer} ${androidInfo.model}';
      case TargetPlatform.iOS:
        IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
        _osVersionDevice = iosInfo.systemVersion;
        _modelNameDevice = iosInfo.utsname.machine;
      default:
        WebBrowserInfo webBrowserInfo = await _deviceInfo.webBrowserInfo;
        _osVersionDevice = webBrowserInfo.appVersion ?? '';
        _modelNameDevice = webBrowserInfo.userAgent ?? '';
    }

    await _saveService.save(
      membersId: memberObs.value.id,
      devicePlatform: _platformDevice,
      deviceToken: token,
      osVersion: _osVersionDevice,
      modelName: _modelNameDevice,
      appVersion: '1.0',
    );

    print(token);

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }

  Future<void> _backgroundHandler(RemoteMessage message) async {
    final documentId = (message.data['documentId'] ?? '').toString();
    final documentFrom = (message.data['documentFrom'] ?? '').toString();
    final page = (message.data['page'] ?? '').toString();
    if (page == 'NdaReceiver') {
      // Pages.toReceiveNda(
      //   arguments: {
      //     'documentId': documentId,
      //     'documentFrom': documentFrom,
      //   },
      // );
    }
  }

  Future<void> _onMessageHandler(RemoteMessage event) async {
    if (event.notification == null) {
      return;
    }

    final title = event.notification?.title;
    final message = event.notification?.body;
    _dataEvent = event.data;

    if ((title?.isNotEmpty ?? false) && (message?.isNotEmpty ?? false)) {
      if (kIsWeb) {
        context.callMethod(
          'showNotification',
          [title, message, onTapNotification],
        );
      } else {
        // await showLocalNotification(
        //   title: title,
        //   message: message,
        //   onTapNotification: onTapNotification,
        // );
      }
    }
  }

  Future<void> _onMessageOpenApp(RemoteMessage message) async {
    final documentId = (message.data['documentId'] ?? '').toString();
    final documentFrom = (message.data['documentFrom'] ?? '').toString();
    final page = (message.data['page'] ?? '').toString();
    if (page == 'NdaReceiver') {
      // Pages.toReceiveNda(
      //   arguments: {
      //     'documentId': documentId,
      //     'documentFrom': documentFrom,
      //   },
      // );
    }
  }

  void onTapNotification() {
    if (_dataEvent != null) {
      final documentId = (_dataEvent?['documentId'] ?? '').toString();
      final documentFrom = (_dataEvent?['documentFrom'] ?? '').toString();
      final page = (_dataEvent?['page'] ?? '').toString();
      if (page == 'NdaReceiver') {
        // Pages.toReceiveNda(
        //   arguments: {
        //     'documentId': documentId,
        //     'documentFrom': documentFrom,
        //   },
        // );
      }
    }
  }
}
