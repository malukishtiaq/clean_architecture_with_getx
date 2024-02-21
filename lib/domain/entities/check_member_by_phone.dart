abstract class CheckMemberByPhoneEntity {
  const CheckMemberByPhoneEntity({
    this.membersId,
    this.phoneCountryCode,
    this.phoneNo,
    this.email,
    this.firstName,
    this.lastName,
  });

  final int? membersId;
  final String? phoneCountryCode;
  final String? phoneNo;
  final String? email;
  final String? firstName;
  final String? lastName;

  CheckMemberByPhoneEntity copyWith({
    final int? membersId,
    final String? phoneCountryCode,
    final String? phoneNo,
    final String? email,
    final String? firstName,
    final String? lastName,
  });
}
