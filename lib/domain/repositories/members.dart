import 'dart:convert';

import 'package:get/get.dart';

import '../../app/services/file.dart';
import '../../app/services/secure_storage.dart';
import '../../app/tools/functions/api.dart';
import '../../data/members/delete_account.dart';
import '../../data/members/delete_data.dart';
import '../../data/members/export.dart';
import '../../data/members/forgot_password/reset_password.dart';
import '../../data/members/save_settings.dart';
import '../entities/member.dart';
import '../entities/otp_forgot_password.dart';
import '../use_cases/api_invalid.dart';
import '../use_cases/member.dart';
import '../use_cases/otp_forgot_password.dart';

class MembersRepository extends GetxController {
  factory MembersRepository() {
    if (Get.isRegistered<MembersRepository>()) {
      return Get.find<MembersRepository>();
    } else {
      return Get.put(MembersRepository._(), permanent: true);
    }
  }

  MembersRepository._();

  Rx<MemberEntity> memberObs = const MemberUseCase().obs;
  Rx<OtpForgotPasswordEntity> memberOtpForgotPasswordObs =
      OtpForgotPasswordUseCase().obs;

  final _secureStorageService = SecureStorageService();

  final _membersRegisterApi = MembersRegisterApi();
  final _membersGetApi = MembersGetApi();
  final _membersDeleteAccountApi = MembersDeleteAccountApi();
  final _membersDeleteDataApi = MembersDeleteDataApi();
  final _fileService = FileService();
  final _membersAvatarGetApi = MembersAvatarGetApi();
  final _membersSaveApi = MembersSaveApi();
  final _membersSavePasswordApi = MembersSavePasswordApi();
  final _membersSaveSettingsApi = MembersSaveSettingsApi();
  final _resetPasswordForgotPasswordApi = ResetPasswordForgotPasswordApi();

  Future<String?> register({
    String? email,
    String? password,
    String? userName,
    String? socialFacebookId,
    String? socialFacebookToken,
    String? socialLinkedInId,
    String? socialLinkedInToken,
    String? socialGmailId,
    String? socialAppleId,
    String? firstName,
    String? lastName,
    String? phoneCountryCode,
    String? phoneNo,
    String? country,
  }) async {
    return await _membersRegisterApi
        .register(
      email: email,
      password: password,
      socialAppleId: socialAppleId,
      socialFacebookId: socialFacebookId,
      socialFacebookToken: socialFacebookToken,
      socialGmailId: socialGmailId,
      socialLinkedInId: socialLinkedInId,
      socialLinkedInToken: socialLinkedInToken,
      userName: userName,
      firstName: firstName,
      lastName: lastName,
      phoneCountryCode: phoneCountryCode,
      phoneNo: phoneNo,
      country: country,
    )
        .call(
      (response) {
        final isSuccess = isSuccessResponse(response);

        if (isSuccess) {
          memberObs.value = MemberUseCase.fromJson(
            json.decode(response.body) as Map<String, dynamic>,
          );

          return null;
        } else {
          final errorValue = ApiInvalidUseCase.fromJson(
            json.decode(response.body) as Map<String, dynamic>,
          );

          return errorValue.message;
        }
      },
      forceCall: true,
    );
  }

  Future<bool?> getMember({
    int? id,
  }) async {
    return _membersGetApi
        .getMemberInfo(
      id: id,
    )
        .call(
      (response) {
        final isSuccess = isSuccessResponse(response);

        if (isSuccess) {
          memberObs.value = MemberUseCase.fromJson(
            json.decode(response.body) as Map<String, dynamic>,
          );
        }
        return isSuccess;
      },
    );
  }

  Future<String?> updateMember({
    String? email,
    String? userName,
    String? socialFacebookId,
    String? socialFacebookToken,
    String? socialLinkedInId,
    String? socialLinkedInToken,
    String? socialGmailId,
    String? socialAppleId,
    String? firstName,
    String? lastName,
    String? phoneCountryCode,
    String? phoneNo,
    String? country,
  }) async {
    final _emailSavedSecure = await _secureStorageService.storedEmail;
    final _tempAvatar = memberObs.value.avatar;

    final result = await _membersSaveApi
        .saveMember(
      membersId: memberObs.value.id ?? 0,
      email: email,
      socialAppleId: socialAppleId,
      socialFacebookId: socialFacebookId,
      socialFacebookToken: socialFacebookToken,
      socialGmailId: socialGmailId,
      socialLinkedInId: socialLinkedInId,
      socialLinkedInToken: socialLinkedInToken,
      userName: userName,
      firstName: firstName,
      lastName: lastName,
      phoneCountryCode: phoneCountryCode,
      phoneNo: phoneNo,
      country: country,
    )
        .call(
      (response) {
        final isSuccess = isSuccessResponse(response);

        if (isSuccess) {
          memberObs.value = MemberUseCase.fromJson(
            json.decode(response.body) as Map<String, dynamic>,
          );

          return null;
        } else {
          final errorValue = ApiInvalidUseCase.fromJson(
            json.decode(response.body) as Map<String, dynamic>,
          );

          return errorValue.message;
        }
      },
    );

    if (result == null) {
      if (_tempAvatar?.isNotEmpty == true) {
        memberObs.value = memberObs.value.copyWith(avatar: _tempAvatar);
      }

      if (_emailSavedSecure?.isNotEmpty == true &&
          _emailSavedSecure != memberObs.value.email) {
        _secureStorageService.setEmail(memberObs.value.email);
      }
    }

    return result;
  }

  Future<String?> updatePassword({
    required String newPassword,
  }) async {
    final _passwordSavedSecure = await _secureStorageService.storedPass;
    final _tempAvatar = memberObs.value.avatar;

    final result = await _membersSavePasswordApi
        .savePassword(
      membersId: memberObs.value.id ?? 0,
      currentPassword: memberObs.value.password ?? '',
      newPassword: newPassword,
    )
        .call(
      (response) {
        final isSuccess = isSuccessResponse(response);

        if (isSuccess) {
          memberObs.value = MemberUseCase.fromJson(
            json.decode(response.body) as Map<String, dynamic>,
          );

          return null;
        } else {
          final errorValue = ApiInvalidUseCase.fromJson(
            json.decode(response.body) as Map<String, dynamic>,
          );

          return errorValue.message;
        }
      },
    );

    if (result == null) {
      if (_tempAvatar?.isNotEmpty == true) {
        memberObs.value = memberObs.value.copyWith(avatar: _tempAvatar);
      }

      if (_passwordSavedSecure?.isNotEmpty == true) {
        _secureStorageService.setPass(memberObs.value.password);
      }
    }

    return result;
  }

  Future<bool?> saveSettings({
    bool? settingsFaceId,
    bool? settingsNotifications,
  }) async {
    final result = await _membersSaveSettingsApi
        .saveSettings(
      id: memberObs.value.id,
      settingsFaceId: settingsFaceId,
      settingsNotifications: settingsNotifications,
    )
        .call(
      (response) {
        final isSuccess = isSuccessResponse(response);
        if (isSuccess) {
          memberObs.value = MemberUseCase.fromJson(
            json.decode(response.body) as Map<String, dynamic>,
          );
          return true;
        }
        return false;
      },
    );
    return result;
  }

  Future<bool> saveAvatar({
    String? filePath,
    List<int>? fileBytes,
    String? mimeType,
  }) async {
    final result = await _fileService.uploadAvatar(
      id: memberObs.value.id,
      filePath: filePath,
      fileBytes: fileBytes,
      mimeType: mimeType,
    );

    if (result != null && (result.id ?? 0) > 0) {
      final _resultGetAvatar =
          await _fileService.getAvatar(id: memberObs.value.id ?? 0);

      if (_resultGetAvatar?.isNotEmpty == true) {
        memberObs.value = memberObs.value.copyWith(avatar: _resultGetAvatar);
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<void> getAvatar() async {
    final result = await _membersAvatarGetApi
        .getAvatar(membersId: memberObs.value.id ?? 0)
        .call((response) {
      final isSuccess = isSuccessResponse(response);

      if (isSuccess) {
        return response.body.replaceAll('"', '');
      }
    });

    //TODO ckeck necesity of replaceall in these around
    if (result?.isNotEmpty == true) {
      memberObs.value =
          memberObs.value.copyWith(avatar: result?.replaceAll('"', ''));
    }
  }

  Future<bool?> deleteAccount() async {
    return _membersDeleteAccountApi
        .deleteAccount(
      id: memberObs.value.id ?? 0,
    )
        .call(
      (response) {
        final isSuccess = isSuccessResponse(response);

        if (isSuccess) {
          return true;
        }
        return isSuccess;
      },
    );
  }

  Future<bool?> deleteData() async {
    return _membersDeleteDataApi
        .deleteData(
      id: memberObs.value.id ?? 0,
    )
        .call(
      (response) {
        final isSuccess = isSuccessResponse(response);

        if (isSuccess) {
          return true;
        }
        return isSuccess;
      },
    );
  }

  Future<bool?> resetPassword({
    int? membersId,
    String? newPassword,
    String? otp,
  }) async {
    final result = await _resetPasswordForgotPasswordApi
        .resetPassword(
      membersId: membersId,
      newPassword: newPassword,
      otp: otp,
    )
        .call(
      (response) {
        final isSuccess = isSuccessResponse(response);
        if (isSuccess) {
          memberObs.value = MemberUseCase.fromJson(
            json.decode(response.body) as Map<String, dynamic>,
          );
        }
        return isSuccess;
      },
      forceCall: true,
    );
    return result;
  }
}
