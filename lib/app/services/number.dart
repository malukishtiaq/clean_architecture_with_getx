import 'dart:convert';

import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:get/get.dart';

import '../../domain/use_cases/phone_number.dart';

class NumberService extends GetxController {
  factory NumberService() {
    if (Get.isRegistered<NumberService>()) {
      return Get.find<NumberService>();
    } else {
      return Get.put(NumberService._());
    }
  }

  NumberService._();

  Future<String?> setNumberPhoneValid({
    required String phoneNumber,
    required String countryCode,
  }) async {
    try {
      final result = await parse(
        phoneNumber,
        region: countryCode,
      );

      const JsonEncoder encoder = JsonEncoder.withIndent('  ');
      final parsePhoneNumber = encoder.convert(result);

      final phoneNumberEntity =
          PhoneNumberUseCase.fromJson(json.decode(parsePhoneNumber));

      return phoneNumberEntity.nationalNumber.toString();
    } catch (e) {
      return null;
    }
  }
}
