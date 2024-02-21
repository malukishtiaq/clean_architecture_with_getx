import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/send_otp.dart';

class SendOtpUseCase extends SendOtpEntity {
  const SendOtpUseCase({
    super.status,
  });

  factory SendOtpUseCase.fromJson(Map<String, dynamic> json) {
    return SendOtpUseCase(
      status: ParseFromDynamic.parseToString(input: json['Status']),
    );
  }

  @override
  SendOtpEntity copyWith({
    final String? status,
  }) {
    return SendOtpUseCase(
      status: status ?? super.status,
    );
  }
}
