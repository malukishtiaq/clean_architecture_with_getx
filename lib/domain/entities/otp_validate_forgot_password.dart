abstract class OtpValidateForgotPasswordEntity {
  const OtpValidateForgotPasswordEntity({
    this.id,
    this.otpValid,
  });

  final int? id;
  final String? otpValid;

  OtpValidateForgotPasswordEntity copyWith({
    final int? id,
    final String? otpValid,
  });
}
