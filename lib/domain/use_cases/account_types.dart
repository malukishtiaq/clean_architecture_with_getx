import '../entities/account_type.dart';
import '../entities/account_types.dart';
import 'account_type.dart';

class AccountTypesUseCase extends AccountTypesEntity {
  const AccountTypesUseCase({
    super.accountTypes,
  });

  factory AccountTypesUseCase.fromJson(Map<String, dynamic> json) {
    final _allAccountTypes = (json['EntityTypesList'] as List<dynamic>)
        .map(
          (accountType) =>
              AccountTypeUseCase.fromJson(accountType as Map<String, dynamic>),
        )
        .toList();

    return AccountTypesUseCase(accountTypes: _allAccountTypes);
  }

  @override
  AccountTypesEntity copyWith({
    final List<AccountTypeEntity>? accountTypes,
  }) {
    return AccountTypesUseCase(
      accountTypes: accountTypes ?? super.accountTypes,
    );
  }
}
