abstract class OtpForgotPasswordEntity {
  const OtpForgotPasswordEntity({
    this.email,
    this.phoneCountryCode,
    this.phoneNo,
    this.sentOtpEmail,
    this.sentOtpPhone,
  });

  final String? email;
  final String? phoneCountryCode;
  final String? phoneNo;
  final bool? sentOtpEmail;
  final bool? sentOtpPhone;

  OtpForgotPasswordEntity copyWith({
    final String? email,
    final String? phoneCountryCode,
    final String? phoneNo,
    final bool? sentOtpEmail,
    final bool? sentOtpPhone,
  });
}
