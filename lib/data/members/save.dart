import 'dart:convert';
import 'package:get/get.dart';
import '../../app/api/api_export.dart';

class MembersSaveApi extends DataInterface with EnvironmentApi, AuthClient {
  factory MembersSaveApi() {
    if (Get.isRegistered<MembersSaveApi>()) {
      return Get.find<MembersSaveApi>();
    } else {
      return Get.put(
        MembersSaveApi._(),
      );
    }
  }

  MembersSaveApi._();

  @override
  String get route => '/Members';

  AuthRequest saveMember({
    required int membersId,
    String? email,
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
    final request = patch(path: '/Save')
      ..body = jsonEncode({
        'MembersId': membersId,
        'Email': email,
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
