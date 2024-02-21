import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/get_otp.dart';

class GetOtpUseCase extends GetOtpEntity {
  const GetOtpUseCase({
    super.isExists,
    super.membersId,
    super.oneTimePassword,
  });

  factory GetOtpUseCase.fromJson(Map<String, dynamic> json) {
    final oneTimePass = json['OneTimePass'] as Map<String, dynamic>;

    return GetOtpUseCase(
      isExists: ParseFromDynamic.toBool(input: oneTimePass['IsExists']),
      membersId: ParseFromDynamic.toInt(input: oneTimePass['MembersId']),
      oneTimePassword:
          ParseFromDynamic.parseToString(input: oneTimePass['OneTimePassword']),
    );
  }

  @override
  GetOtpEntity copyWith({
    final bool? isExists,
    final int? membersId,
    final String? oneTimePassword,
  }) {
    return GetOtpUseCase(
      isExists: isExists ?? super.isExists,
      membersId: membersId ?? super.membersId,
      oneTimePassword: oneTimePassword ?? super.oneTimePassword,
    );
  }
}
