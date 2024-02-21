import 'dart:convert';
import 'package:get/get.dart';
import '../../app/api/api_export.dart';

class MembersAuthenticate extends DataInterface
    with EnvironmentApi, AuthClient {
  factory MembersAuthenticate() {
    if (Get.isRegistered<MembersAuthenticate>()) {
      return Get.find<MembersAuthenticate>();
    } else {
      return Get.put(
        MembersAuthenticate._(),
      );
    }
  }

  MembersAuthenticate._();

  @override
  String get route => '/Members';

  AuthRequest authenticate({
    String? email,
    String? password,
    String? socialFacebookId,
    String? socialFacebookToken,
    String? socialLinkedInId,
    String? socialLinkedInToken,
    String? socialGmailId,
    String? socialAppleId,
  }) {
    final request = post(path: '/Authenticate');

    request.body = jsonEncode({
      'Email': email,
      'Password': password,
      'SocialFacebookId': socialFacebookId,
      'SocialFacebookToken': socialFacebookToken,
      'SocialLinkedInId': socialLinkedInId,
      'SocialLinkedInToken': socialLinkedInToken,
      'SocialGmailId': socialGmailId,
      'SocialAppleId': socialAppleId,
    });

    return request;
  }
}
