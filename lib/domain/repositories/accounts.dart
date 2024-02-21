import 'dart:convert';

import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';

import '../../app/tools/functions/api.dart';
import '../../data/accounts/get_account_types.dart';
import '../../data/accounts/get_by_member.dart';
import '../../data/accounts/register.dart';
import '../../data/accounts/signature/get.dart';
import '../../data/accounts/signature/save.dart';
import '../entities/account_by_member.dart';
import '../entities/account_types.dart';
import '../use_cases/account_by_member.dart';
import '../use_cases/account_types.dart';

class AccountsRepository extends GetxController {
  factory AccountsRepository() {
    if (Get.isRegistered<AccountsRepository>()) {
      return Get.find<AccountsRepository>();
    } else {
      return Get.put(AccountsRepository._(), permanent: true);
    }
  }

  AccountsRepository._();

  Rx<AccountTypesEntity> accountTypesObs = const AccountTypesUseCase().obs;
  Rx<AccountByMemberEntity> accountObs = const AccountByMemberUseCase().obs;
  Rx<String> urlSignature = ''.obs;
  Rx<AccountByMemberEntity> accountByMemberObs =
      const AccountByMemberUseCase().obs;

  final _getAccountTypes = GetAccountTypes();
  final _accountsRegisterApi = AccountsRegisterApi();
  final _getByMember = GetByMemberApi();
  final _saveSignatureApi = SaveSignatureApi();
  final _getSignatureApi = GetSignatureApi();

  Future<bool?> getAccountTypes() async {
    return _getAccountTypes.getAccountTypes().call(
      (response) {
        final isSuccess = isSuccessResponse(response);

        if (isSuccess) {
          accountTypesObs.value = AccountTypesUseCase.fromJson(
            jsonDecode(response.body),
          );
          return true;
        }
        return false;
      },
      forceCall: true,
    );
  }

  Future<bool?> register({
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
  }) async {
    return await _accountsRegisterApi
        .register(
      membersId: membersId,
      addressLocation: addressLocation,
      addressStreet: addressStreet,
      addressAppOrSuite: addressAppOrSuite,
      addressCity: addressCity,
      addressState: addressState,
      addressZipCode: addressZipCode,
      addressLongitude: addressLongitude,
      addressLatitude: addressLatitude,
      entityTypesId: entityTypesId,
      statesId: statesId,
      name: name,
      description: description,
    )
        .call(
      (response) {
        final isSuccess = isSuccessResponse(response);

        if (isSuccess) {
          accountObs.value = AccountByMemberUseCase.fromJson(
            json.decode(response.body),
          );

          return true;
        } else {
          return false;
        }
      },
      forceCall: true,
    );
  }

  Future<bool?> getAccountByMember({
    int? membersId,
  }) async {
    return _getByMember.getByMember(membersId: membersId).call(
      (response) {
        final isSuccess = isSuccessResponse(response);

        if (isSuccess) {
          accountByMemberObs.value = AccountByMemberUseCase.fromJson(
            jsonDecode(response.body),
          );
          return true;
        }
        return false;
      },
      forceCall: true,
    );
  }

  Future<bool?> saveSignature({
    int? accountId,
    String? filePath,
  }) async {
    final fields = {'AccountId': accountId.toString()};

    final _tempPath = filePath?.toLowerCase();
    var _mediaType = MediaType('image', 'jpeg');

    if ((_tempPath ?? '').contains('.jpg')) {
      _mediaType = MediaType('image', 'jpg');
    } else if ((_tempPath ?? '').contains('.png')) {
      _mediaType = MediaType('image', 'png');
    }
    return await _saveSignatureApi.save().callMultiPartForm(
      (response) {
        final isSuccess = isSuccessResponse(response);

        if (isSuccess) {
          accountObs.value = AccountByMemberUseCase.fromJson(
            json.decode(response.body),
          );

          return true;
        } else {
          return false;
        }
      },
      fields: fields,
      filePath: filePath,
      contentType: _mediaType,
    );
  }

  Future<bool?> getSignature({
    int? accountId,
  }) async {
    return _getSignatureApi.getSignature(accountsId: accountId).call(
      (response) {
        final isSuccess = isSuccessResponse(response);

        if (isSuccess) {
          urlSignature = response.body.obs;
          return true;
        }
        return false;
      },
      forceCall: true,
    );
  }
}
