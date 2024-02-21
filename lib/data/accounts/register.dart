import 'dart:convert';
import '../../../app/api/api_export.dart';
import 'package:get/get.dart';

class AccountsRegisterApi extends DataInterface
    with EnvironmentApi, AuthClient {
  factory AccountsRegisterApi() {
    if (Get.isRegistered<AccountsRegisterApi>()) {
      return Get.find<AccountsRegisterApi>();
    } else {
      return Get.put(
        AccountsRegisterApi._(),
      );
    }
  }

  AccountsRegisterApi._();

  @override
  String get route => '/Accounts';

  AuthRequest register({
    int? membersId,
    String? addressLocation,
    String? addressStreet,
    String? addressAppOrSuite,
    String? addressCity,
    String? addressState,
    String? addressZipCode,
    double? addressLongitude,
    double? addressLatitude,
    int? entityTypesId,
    int? statesId,
    String? name,
    String? description,
  }) {
    final request = post(path: '/Register')
      ..body = jsonEncode({
        'MembersId': membersId,
        'AddressLocation': addressLocation,
        'AddressStreet': addressStreet,
        'AddressAppOrSuite': addressAppOrSuite,
        'AddressCity': addressCity,
        'AddressState': addressState,
        'AddressZipCode': addressZipCode,
        'AddressLongitude': addressLongitude,
        'AddressLatitude': addressLatitude,
        'EntityTypesId': entityTypesId,
        'StatesId': statesId,
        'Name': name,
        'Description': description,
      });
    return request;
  }
}
