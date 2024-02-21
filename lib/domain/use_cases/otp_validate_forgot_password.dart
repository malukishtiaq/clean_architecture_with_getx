import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/otp_validate_forgot_password.dart';

class OtpValidateForgotPasswordUseCase extends OtpValidateForgotPasswordEntity {
  OtpValidateForgotPasswordUseCase({
    super.id,
    super.otpValid,
  });

  factory OtpValidateForgotPasswordUseCase.fromJson(
    Map<String, dynamic> json,
  ) =>
      OtpValidateForgotPasswordUseCase(
        id: ParseFromDynamic.toInt(input: json['Id']),
        otpValid: ParseFromDynamic.parseToString(input: json['OtpValid']),
      );

  @override
  OtpValidateForgotPasswordUseCase copyWith({
    int? id,
    String? otpValid,
  }) =>
      OtpValidateForgotPasswordUseCase(
        id: id ?? this.id,
        otpValid: otpValid ?? this.otpValid,
      );
}
