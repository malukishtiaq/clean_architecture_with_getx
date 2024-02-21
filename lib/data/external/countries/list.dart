import 'dart:convert';

import 'package:get/get.dart';

import '../../../app/api/api_export.dart';

class ExternalCountriesList extends DataInterface
    with EnvironmentApi, AuthClient {
  factory ExternalCountriesList() {
    if (Get.isRegistered<ExternalCountriesList>()) {
      return Get.find<ExternalCountriesList>();
    } else {
      return Get.put(
        ExternalCountriesList._(),
      );
    }
  }

  ExternalCountriesList._();

  @override
  String get route => '/External';

  AuthRequest getCountries({
    String? searchString,
  }) {
    final request = post(path: '/Countries/List');

    request.body = jsonEncode({
      'SearchString': searchString,
    });

    return request;
  }
}
