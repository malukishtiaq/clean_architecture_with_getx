import 'dart:convert';

import 'package:get/get.dart';

import '../../../../data/members/export.dart';
import '../../../../domain/entities/send_otp.dart';
import '../../../../domain/entities/validate_otp.dart';
import '../../../../domain/use_cases/send_otp.dart';
import '../../../../domain/use_cases/validate_otp.dart';
import '../../../tools/functions/api.dart';

class OtpService extends GetxController {
  factory OtpService() {
    if (Get.isRegistered<OtpService>()) {
      return Get.find<OtpService>();
    } else {
      return Get.put(OtpService._());
    }
  }

  OtpService._();

  final _memberSendOtpEmailApi = MemberSendOtpEmailApi();
  final _memberSendOtpSmsApi = MemberSendOtpSmsApi();
  final _validateOtp = MemberValidateOtpApi();

  Future<SendOtpEntity?> sendOtpEmail({
    required int membersId,
  }) async {
    return _memberSendOtpEmailApi
        .sendOtpInEmail(
      membersId: membersId,
    )
        .call((response) {
      final isSuccess = isSuccessResponse(response);

      if (!isSuccess) {
        return null;
      }

      return SendOtpUseCase.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      );
    });
  }

  Future<SendOtpEntity?> sendOtpSms({
    required int membersId,
  }) async {
    return _memberSendOtpSmsApi
        .sendOtpInSms(
      membersId: membersId,
    )
        .call((response) {
      final isSuccess = isSuccessResponse(response);

      if (!isSuccess) {
        return null;
      }

      return SendOtpUseCase.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      );
    });
  }

  Future<ValidateOtpEntity?> validate({
    required int membersId,
    required String otp,
    bool? isEmail,
  }) async {
    return _validateOtp
        .validateOtp(
      membersId: membersId,
      otp: otp,
      isEmail: isEmail,
    )
        .call((response) {
      final isSuccess = isSuccessResponse(response);

      if (!isSuccess) {
        return null;
      }

      return ValidateOtpUseCase.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      );
    });
  }
}
