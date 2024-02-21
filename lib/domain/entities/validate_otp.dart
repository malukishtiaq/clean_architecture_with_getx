import '../../app/constants/otp_status.dart';

abstract class ValidateOtpEntity {
  const ValidateOtpEntity({
    this.otpValid,
  });

  final OtpStatus? otpValid;

  ValidateOtpEntity copyWith({
    final OtpStatus? otpValid,
  });
}
