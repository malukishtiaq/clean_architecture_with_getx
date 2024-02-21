import 'dart:convert';
import '../../app/api/api_export.dart';
import 'package:get/get.dart';

class SendApi extends DataInterface with EnvironmentApi, AuthClient {
  factory SendApi() {
    if (Get.isRegistered<SendApi>()) {
      return Get.find<SendApi>();
    } else {
      return Get.put(
        SendApi._(),
      );
    }
  }

  SendApi._();

  @override
  String get route => '/Documents';

  AuthRequest send({
    int? membersId,
    int? membersIdReceiver,
    String? phoneNoRecipient,
    String? fullNameRecipient,
  }) {
    final request = post(path: '/Send')
      ..body = jsonEncode({
        'MembersId': membersId,
        'MembersIdReceiver': membersIdReceiver,
        'PhoneNoRecipient': phoneNoRecipient,
        'FullNameRecipient': fullNameRecipient,
      });

    return request;
  }
}
