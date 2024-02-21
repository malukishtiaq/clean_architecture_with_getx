import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/otp_forgot_password.dart';

class OtpForgotPasswordUseCase extends OtpForgotPasswordEntity {
  OtpForgotPasswordUseCase({
    super.email,
    super.phoneCountryCode,
    super.phoneNo,
    super.sentOtpEmail,
    super.sentOtpPhone,
  });

  factory OtpForgotPasswordUseCase.fromJson(Map<String, dynamic> json) =>
      OtpForgotPasswordUseCase(
        email: ParseFromDynamic.parseToString(input: json['Email']),
        phoneCountryCode:
            ParseFromDynamic.parseToString(input: json['PhoneCountryCode']),
        phoneNo: ParseFromDynamic.parseToString(input: json['PhoneNo']),
        sentOtpEmail: ParseFromDynamic.toBool(input: json['SentOtpEmail']),
        sentOtpPhone: ParseFromDynamic.toBool(input: json['SentOtpPhone']),
      );

  @override
  OtpForgotPasswordUseCase copyWith({
    String? email,
    String? phoneCountryCode,
    String? phoneNo,
    bool? sentOtpEmail,
    bool? sentOtpPhone,
  }) =>
      OtpForgotPasswordUseCase(
        email: email ?? this.email,
        phoneCountryCode: phoneCountryCode ?? this.phoneCountryCode,
        phoneNo: phoneNo ?? this.phoneNo,
        sentOtpEmail: sentOtpEmail ?? this.sentOtpEmail,
        sentOtpPhone: sentOtpPhone ?? this.sentOtpPhone,
      );
}
