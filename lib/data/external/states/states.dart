import 'package:get/get.dart';

import '../../../app/api/api_export.dart';

class ExternalStatesList extends DataInterface with EnvironmentApi, AuthClient {
  factory ExternalStatesList() {
    if (Get.isRegistered<ExternalStatesList>()) {
      return Get.find<ExternalStatesList>();
    } else {
      return Get.put(
        ExternalStatesList._(),
      );
    }
  }

  ExternalStatesList._();

  @override
  String get route => '/External';

  AuthRequest getStates({
    String? searchString,
  }) {
    final request = get(path: '/States/List');

    return request;
  }
}
