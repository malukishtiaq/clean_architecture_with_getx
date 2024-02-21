import '../../app/constants/otp_status.dart';
import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/validate_otp.dart';

class ValidateOtpUseCase extends ValidateOtpEntity {
  const ValidateOtpUseCase({
    super.otpValid,
  });

  factory ValidateOtpUseCase.fromJson(Map<String, dynamic> json) {
    return ValidateOtpUseCase(
      otpValid: ParseFromDynamic.parseToOtpStatus(input: json['OtpValid']),
    );
  }

  @override
  ValidateOtpEntity copyWith({
    final OtpStatus? otpValid,
  }) {
    return ValidateOtpUseCase(
      otpValid: otpValid ?? super.otpValid,
    );
  }
}
