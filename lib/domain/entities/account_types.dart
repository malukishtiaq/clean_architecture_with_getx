import 'account_type.dart';

abstract class AccountTypesEntity {
  const AccountTypesEntity({
    this.accountTypes,
  });

  final List<AccountTypeEntity>? accountTypes;

  AccountTypesEntity copyWith({
    final List<AccountTypeEntity>? accountTypes,
  });
}
