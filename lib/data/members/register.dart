import 'dart:convert';
import 'package:get/get.dart';
import '../../app/api/api_export.dart';

class MembersRegisterApi extends DataInterface with EnvironmentApi, AuthClient {
  factory MembersRegisterApi() {
    if (Get.isRegistered<MembersRegisterApi>()) {
      return Get.find<MembersRegisterApi>();
    } else {
      return Get.put(
        MembersRegisterApi._(),
      );
    }
  }

  MembersRegisterApi._();

  @override
  String get route => '/Members';

  AuthRequest register({
    String? email,
    String? password,
    String? socialFacebookId,
    String? socialFacebookToken,
    String? socialLinkedInId,
    String? socialLinkedInToken,
    String? socialGmailId,
    String? socialAppleId,
    String? firstName,
    String? lastName,
    String? userName,
    String? phoneCountryCode,
    String? phoneNo,
    String? country,
  }) {
    final request = post(path: '/Register')
      ..body = jsonEncode({
        'Email': email,
        'Password': password,
        'SocialFacebookId': socialFacebookId,
        'SocialFacebookToken': socialFacebookToken,
        'SocialLinkedInId': socialLinkedInId,
        'SocialLinkedInToken': socialLinkedInToken,
        'SocialGmailId': socialGmailId,
        'SocialAppleId': socialAppleId,
        'FirstName': firstName,
        'LastName': lastName,
        'UserName': userName,
        'PhoneCountryCode': phoneCountryCode,
        'PhoneNo': phoneNo,
        'Country': country,
      });

    return request;
  }
}
