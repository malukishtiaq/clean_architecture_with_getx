import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermissionCamera() async {
  if (await Permission.camera.isGranted) {
    return true;
  }

  final status = await Permission.camera.request();
  return status.isGranted;
}

Future<bool> requestPermissionSendSms() async {
  if (await Permission.sms.isGranted) {
    return true;
  }

  final status = await Permission.sms.request();
  return status.isGranted;
}
