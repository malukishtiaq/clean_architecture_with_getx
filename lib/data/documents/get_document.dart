import 'dart:convert';
import '../../app/api/api_export.dart';
import 'package:get/get.dart';

class GetDocumentApi extends DataInterface with EnvironmentApi, AuthClient {
  factory GetDocumentApi() {
    if (Get.isRegistered<GetDocumentApi>()) {
      return Get.find<GetDocumentApi>();
    } else {
      return Get.put(GetDocumentApi._());
    }
  }

  GetDocumentApi._();

  @override
  String get route => '/Documents';

  AuthRequest getDocument({
    required int accountId,
    required int documentId,
  }) {
    final request = post(path: '/Get')
      ..body = jsonEncode({
        'AccountId': accountId,
        'DocumentId': documentId,
      });

    return request;
  }
}
