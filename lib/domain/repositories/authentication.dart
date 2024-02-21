import 'dart:convert';

import 'package:get/get.dart';

import '../../app/services/secure_storage.dart';
import '../../app/tools/functions/api.dart';
import '../../data/members/export.dart';
import '../entities/authentication.dart';
import '../use_cases/authentication.dart';

class AuthenticationRepository extends GetxController {
  factory AuthenticationRepository() {
    if (Get.isRegistered<AuthenticationRepository>()) {
      return Get.find<AuthenticationRepository>();
    } else {
      return Get.put(AuthenticationRepository._(), permanent: true);
    }
  }

  AuthenticationRepository._();

  final _membersAuthenticateApi = MembersAuthenticate();

  final _secureStorage = SecureStorageService();

  Rx<AuthenticationEntity> authenticationObs =
      const AuthenticationUseCase().obs;

  Future<bool?> authenticate({
    String? email,
    String? password,
    String? socialFacebookId,
    String? socialFacebookToken,
    String? socialLinkedInId,
    String? socialLinkedInToken,
    String? socialGmailId,
    String? socialAppleId,
    bool? isRememberMe,
  }) async {
    return _membersAuthenticateApi
        .authenticate(
      email: email,
      password: password,
      socialAppleId: socialAppleId,
      socialFacebookId: socialFacebookId,
      socialFacebookToken: socialFacebookToken,
      socialGmailId: socialGmailId,
      socialLinkedInId: socialLinkedInId,
      socialLinkedInToken: socialLinkedInToken,
    )
        .call(
      (response) {
        final isSuccess = isSuccessResponse(response);

        if (isSuccess) {
          authenticationObs.value = AuthenticationUseCase.fromJson(
            json.decode(response.body) as Map<String, dynamic>,
          );
          if (authenticationObs.value.isAuthenticated == true &&
              isRememberMe == true) {
            _secureStorage.setIsRememberMeCredentials(isRememberMe);
            _secureStorage.setEmail(email);
            _secureStorage.setPass(password);
          }
          if (isRememberMe == false) {
            _secureStorage.setIsRememberMeCredentials(isRememberMe);
            _secureStorage.setEmail('');
            _secureStorage.setPass('');
          }
        }
        return isSuccess;
      },
      forceCall: true,
    );
  }

  Future<void> logout() async {
    // await Get.delete<SignupPresenter>(force: true);
    // await Get.offAndToNamed(Pages.login);
  }

  Future<void> deleteLocalAccountData() async {
    // await Get.delete<SignupPresenter>(force: true);
    await _secureStorage.deleteAll();
    // await Get.offAndToNamed(Pages.login);
  }
}
