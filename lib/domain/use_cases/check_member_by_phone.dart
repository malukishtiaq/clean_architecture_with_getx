import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/check_member_by_phone.dart';

class CheckMemberByPhoneUseCase extends CheckMemberByPhoneEntity {
  CheckMemberByPhoneUseCase({
    super.membersId,
    super.phoneCountryCode,
    super.phoneNo,
    super.email,
    super.firstName,
    super.lastName,
  });

  factory CheckMemberByPhoneUseCase.fromJson(Map<String, dynamic> json) =>
      CheckMemberByPhoneUseCase(
        membersId: ParseFromDynamic.toInt(input: json['MembersId']),
        phoneCountryCode:
            ParseFromDynamic.parseToString(input: json['PhoneCountryCode']),
        phoneNo: ParseFromDynamic.parseToString(input: json['PhoneNo']),
        email: ParseFromDynamic.parseToString(input: json['Email']),
        firstName: ParseFromDynamic.parseToString(input: json['FirstName']),
        lastName: ParseFromDynamic.parseToString(input: json['LastName']),
      );

  @override
  CheckMemberByPhoneUseCase copyWith({
    int? membersId,
    String? phoneCountryCode,
    String? phoneNo,
    String? email,
    String? firstName,
    String? lastName,
  }) =>
      CheckMemberByPhoneUseCase(
        membersId: membersId ?? this.membersId,
        phoneCountryCode: phoneCountryCode ?? this.phoneCountryCode,
        phoneNo: phoneNo ?? this.phoneNo,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );
}
