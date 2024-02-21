abstract class CheckPhoneEmailUsernameEntity {
  const CheckPhoneEmailUsernameEntity({
    this.emailExists,
    this.phoneExists,
    this.userNameExists,
  });

  final bool? emailExists;
  final bool? phoneExists;
  final bool? userNameExists;

  CheckPhoneEmailUsernameEntity copyWith({
    final bool? emailExists,
    final bool? phoneExists,
    final bool? userNameExists,
  });
}
