import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/check_phone_email_username.dart';

class CheckPhoneEmailUsernameUseCase extends CheckPhoneEmailUsernameEntity {
  const CheckPhoneEmailUsernameUseCase({
    super.emailExists,
    super.phoneExists,
    super.userNameExists,
  });

  factory CheckPhoneEmailUsernameUseCase.fromJson(Map<String, dynamic> json) {
    final checkInfo = json['CheckInfo'] as Map<String, dynamic>;

    return CheckPhoneEmailUsernameUseCase(
      emailExists: ParseFromDynamic.toBool(input: checkInfo['EmailExists']),
      phoneExists: ParseFromDynamic.toBool(input: checkInfo['PhoneExists']),
      userNameExists:
          ParseFromDynamic.toBool(input: checkInfo['UserNameExists']),
    );
  }

  @override
  CheckPhoneEmailUsernameEntity copyWith({
    final bool? emailExists,
    final bool? phoneExists,
    final bool? userNameExists,
  }) {
    return CheckPhoneEmailUsernameUseCase(
      emailExists: emailExists ?? super.emailExists,
      phoneExists: phoneExists ?? super.phoneExists,
      userNameExists: userNameExists ?? super.userNameExists,
    );
  }
}
