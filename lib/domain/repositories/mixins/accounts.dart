import 'package:get/get.dart';

import '../../entities/account_by_member.dart';
import '../../entities/account_types.dart';
import '../accounts.dart';

mixin AccountsMixin {
  final _accountsRepository = AccountsRepository();

  Rx<AccountTypesEntity> get accountTypesObs =>
      _accountsRepository.accountTypesObs;

  Rx<AccountByMemberEntity> get accountObs => _accountsRepository.accountObs;

  Rx<AccountByMemberEntity> get accountByMemberObs =>
      _accountsRepository.accountByMemberObs;

  Rx<String> get urlSignature => _accountsRepository.urlSignature;

  Future<bool?> Function() get getAccountsTypesList =>
      _accountsRepository.getAccountTypes;

  Future<bool?> Function({
    int? membersId,
    String? addressLocation,
    String? addressStreet,
    String? addressAppOrSuite,
    String? addressCity,
    String? addressState,
    String? addressZipCode,
    double? addressLongitude,
    double? addressLatitude,
    int? entityTypesId,
    int? statesId,
    String? name,
    String? description,
  }) get registerAccounts => _accountsRepository.register;

  Future<bool?> Function({
    int? membersId,
  }) get getAccountByMember => _accountsRepository.getAccountByMember;

  Future<bool?> Function({
    int? accountId,
    String? filePath,
  }) get saveSignature => _accountsRepository.saveSignature;

  Future<bool?> Function({
    int? accountId,
  }) get getSignature => _accountsRepository.getSignature;
}
