import '../../../app/api/api_export.dart';
import 'package:get/get.dart';

class GetAccountTypes extends DataInterface with EnvironmentApi, AuthClient {
  factory GetAccountTypes() {
    if (Get.isRegistered<GetAccountTypes>()) {
      return Get.find<GetAccountTypes>();
    } else {
      return Get.put(
        GetAccountTypes._(),
      );
    }
  }

  GetAccountTypes._();

  @override
  String get route => '/Accounts';

  AuthRequest getAccountTypes() {
    final request = get(path: '/GetAccountTypes');

    return request;
  }
}
