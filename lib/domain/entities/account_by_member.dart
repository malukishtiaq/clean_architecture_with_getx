import 'account_info.dart';
import 'address_info.dart';
import 'entity_type_info.dart';

abstract class AccountByMemberEntity {
  const AccountByMemberEntity({
    this.accountInfo,
    this.addressInfo,
    this.entityTypeInfo,
  });

  final AccountInfoEntity? accountInfo;
  final AddressInfoEntity? addressInfo;
  final EntityTypeInfoEntity? entityTypeInfo;

  AccountByMemberEntity copyWith({
    final AccountInfoEntity? accountInfo,
    final AddressInfoEntity? addressInfo,
    final EntityTypeInfoEntity? entityTypeInfo,
  });
}
