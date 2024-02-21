import '../../../app/api/api_export.dart';
import 'package:get/get.dart';

class GetSignatureApi extends DataInterface with EnvironmentApi, AuthClient {
  factory GetSignatureApi() {
    if (Get.isRegistered<GetSignatureApi>()) {
      return Get.find<GetSignatureApi>();
    } else {
      return Get.put(
        GetSignatureApi._(),
      );
    }
  }

  GetSignatureApi._();

  @override
  String get route => '/Accounts';

  AuthRequest getSignature({
    int? accountsId,
  }) {
    final request = get(path: '/Signature/Get/$accountsId');
    return request;
  }
}
