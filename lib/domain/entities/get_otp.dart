abstract class GetOtpEntity {
  const GetOtpEntity({
    this.isExists,
    this.membersId,
    this.oneTimePassword,
  });

  final bool? isExists;
  final int? membersId;
  final String? oneTimePassword;

  GetOtpEntity copyWith({
    final bool? isExists,
    final int? membersId,
    final String? oneTimePassword,
  });
}
