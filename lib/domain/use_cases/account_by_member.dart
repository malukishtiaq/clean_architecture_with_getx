import '../entities/account_by_member.dart';
import '../entities/account_info.dart';
import '../entities/address_info.dart';
import '../entities/entity_type_info.dart';
import '../use_cases/account_info.dart';
import '../use_cases/address_info.dart';
import 'entity_type_info.dart';

class AccountByMemberUseCase extends AccountByMemberEntity {
  const AccountByMemberUseCase({
    super.accountInfo,
    super.addressInfo,
    super.entityTypeInfo,
  });

  factory AccountByMemberUseCase.fromJson(Map<String, dynamic> json) {
    return AccountByMemberUseCase(
      accountInfo: json['AccountInfo'] == null
          ? null
          : AccountInfoUseCase.fromJson(json['AccountInfo']),
      addressInfo: json['AddressInfo'] == null
          ? null
          : AddressInfoUseCase.fromJson(json['AddressInfo']),
      entityTypeInfo: json['EntityTypeInfo'] == null
          ? null
          : EntityTypeInfoUseCase.fromJson(json['EntityTypeInfo']),
    );
  }

  @override
  AccountByMemberEntity copyWith({
    final AccountInfoEntity? accountInfo,
    final AddressInfoEntity? addressInfo,
    final EntityTypeInfoEntity? entityTypeInfo,
  }) {
    return AccountByMemberUseCase(
      accountInfo: accountInfo ?? super.accountInfo,
      addressInfo: addressInfo ?? super.addressInfo,
      entityTypeInfo: entityTypeInfo ?? super.entityTypeInfo,
    );
  }
}
