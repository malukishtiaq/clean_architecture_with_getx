import 'dart:convert';

import 'package:get/get.dart';

import '../../../../data/members/forgot_password/send_otp.dart';
import '../../../../data/members/forgot_password/validate_otp.dart';
import '../../../../domain/entities/otp_forgot_password.dart';
import '../../../../domain/entities/otp_validate_forgot_password.dart';
import '../../../../domain/use_cases/otp_forgot_password.dart';
import '../../../../domain/use_cases/otp_validate_forgot_password.dart';
import '../../../tools/functions/api.dart';

class OtpForgotPasswordService extends GetxController {
  factory OtpForgotPasswordService() {
    if (Get.isRegistered<OtpForgotPasswordService>()) {
      return Get.find<OtpForgotPasswordService>();
    } else {
      return Get.put(OtpForgotPasswordService._(), permanent: true);
    }
  }

  OtpForgotPasswordService._();

  final _sendOtpForgotPasswordApi = SendOtpForgotPasswordApi();
  final _validateOtpForgotPasswordApi = ValidateOtpForgotPasswordApi();

  Future<OtpForgotPasswordEntity?> sentOtpForgotPassword({
    String? email,
    String? phoneCountryCode,
    String? phoneNo,
  }) async {
    final result = await _sendOtpForgotPasswordApi
        .sendOtp(
      email: email?.trim(),
      phoneCountryCode: phoneCountryCode?.trim(),
      phoneNo: phoneNo?.trim(),
    )
        .call(
      (response) {
        final isSuccess = isSuccessResponse(response);
        if (isSuccess) {
          return OtpForgotPasswordUseCase.fromJson(
            json.decode(response.body) as Map<String, dynamic>,
          );
        }
        return null;
      },
      forceCall: true,
    );
    return result;
  }

  Future<OtpValidateForgotPasswordEntity?> validateForgotPassword({
    String? email,
    String? phoneCountryCode,
    String? phoneNo,
    String? otp,
  }) async {
    final result = await _validateOtpForgotPasswordApi
        .validateOtp(
      email: email?.trim(),
      phoneCountryCode: phoneCountryCode?.trim(),
      phoneNo: phoneNo?.trim(),
      otp: otp,
    )
        .call(
      (response) {
        final isSuccess = isSuccessResponse(response);
        if (isSuccess) {
          return OtpValidateForgotPasswordUseCase.fromJson(
            json.decode(response.body) as Map<String, dynamic>,
          );
        }
        return null;
      },
      forceCall: true,
    );
    return result;
  }
}
