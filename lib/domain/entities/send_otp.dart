abstract class SendOtpEntity {
  const SendOtpEntity({
    this.status,
  });

  final String? status;

  SendOtpEntity copyWith({
    final String? status,
  });
}
