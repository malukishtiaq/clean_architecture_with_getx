import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/services/local_auth_services.dart';
import '../../../app/services/secure_storage.dart';
import '../../../domain/repositories/authentication.dart';
import '../../../domain/repositories/members.dart';
import '../../../domain/repositories/mixins/accounts.dart';
import '../../../domain/repositories/mixins/authentication.dart';
import '../../../domain/repositories/mixins/current_location.dart';

class LoginPresenter extends GetxController
    with AuthenticationMixin, CurrentLocationMixin, AccountsMixin {
  factory LoginPresenter() {
    if (Get.isRegistered<LoginPresenter>()) {
      return Get.find<LoginPresenter>();
    } else {
      return Get.put(LoginPresenter._());
    }
  }

  LoginPresenter._();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<bool> isRememberMe = false.obs;

  Rx<bool> isFaceId = false.obs;

  final _secureStorageServices = SecureStorageService();

  final _authenticationRepository = AuthenticationRepository();

  final _membersRepository = MembersRepository();

  String? _emailStorage;
  String? _passwordStorage;

  Future<void> checkFaceId() async {
    isFaceId.value = await _secureStorageServices.faceIdEnabled;
  }

  Future<void> onInitAuthentication(
    void Function()? onInitLoading,
    void Function()? onCompleteLoading,
  ) async {
    await checkFaceId();

    if (isFaceId.value) {
      final authenticate = await LocalAuthServices.authenticate();
      if (authenticate) {
        onInitLoading?.call();
        _emailStorage = await _secureStorageServices.storedEmail;
        _passwordStorage = await _secureStorageServices.storedPass;
        await getAccountInfoByMember();
        if (_emailStorage?.isNotEmpty == true &&
            _passwordStorage?.isNotEmpty == true) {
          usernameController.text = _emailStorage ?? '';
          passwordController.text = _passwordStorage ?? '';

          await authenticateWithBiometrics(onCompleteLoading);
        }
      }
    }

    final _isRemberMeChecked =
        await _secureStorageServices.storedIsRememberMeCredentials;

    if (_isRemberMeChecked) {
      _emailStorage = await _secureStorageServices.storedEmail;
      _passwordStorage = await _secureStorageServices.storedPass;

      if (_emailStorage?.isNotEmpty == true &&
          _passwordStorage?.isNotEmpty == true) {
        usernameController.text = _emailStorage ?? '';
        passwordController.text = _passwordStorage ?? '';
        isRememberMe.value = _isRemberMeChecked;
      }
    }
  }

  void toggleIsRememberMe() {
    isRememberMe.value = !isRememberMe.value;
  }

  Future<void> onPressedLogin({void Function()? onComplete}) async {
    if (GetUtils.isBlank(usernameController.text) == true ||
        GetUtils.isBlank(passwordController.text) == true) {
      onComplete?.call();
      return;
    }

    final result = await _authenticationRepository.authenticate(
      email: usernameController.text,
      password: passwordController.text,
      isRememberMe: isRememberMe.value,
    );

    if (result == false) {
      // showSnackBar(
      //   title: unexpectedError,
      // );
      onComplete?.call();
      return;
    }

    if (!isUserLoggedIn) {
      onComplete?.call();

      final message =
          _authenticationRepository.authenticationObs.value.httpErrorMessage;

      debugPrint(message);
      // if (message == credentialsDoesNotMatch) {
      //   showSnackBar(
      //     title: invalidCredential,
      //   );
      // } else {
      //   showSnackBar(
      //     title: unexpectedError,
      //   );
      // }
      return;
    }

    await getAccountInfoByMember();
    await setMembersInfo();
    // registerDevice();
    if (checkVerifyAndSetupValues()) {
      //Get.offAndToNamed(Pages.home);
    } else {
      // Get.offAndToNamed(Pages.verifyAndSetup);
    }
  }

  bool checkVerifyAndSetupValues() {
    return (_membersRepository.memberObs.value.avatar?.isNotEmpty == true &&
        _membersRepository.memberObs.value.isEmailVerified == true &&
        _membersRepository.memberObs.value.isPhoneVerified == true &&
        accountByMemberObs.value.accountInfo?.id != null);
  }

  Future<void> authenticateWithBiometrics(
    void Function()? onCompleteLoading,
  ) async {
    final result = await _authenticationRepository.authenticate(
      email: usernameController.text,
      password: passwordController.text,
    );

    if (result == false) {
      // showSnackBar(
      //   title: unexpectedError,
      // );
      onCompleteLoading?.call();
      return;
    }

    if (!isUserLoggedIn) {
      final message =
          _authenticationRepository.authenticationObs.value.httpErrorMessage;

      debugPrint(message);

      // showSnackBar(
      //   title: unexpectedError,
      // );
      onCompleteLoading?.call();
      return;
    }

    await getAccountInfoByMember();
    await setMembersInfo();
    // registerDevice();
    onCompleteLoading?.call();
    if (checkVerifyAndSetupValues()) {
      //Get.offAndToNamed(Pages.home);
    } else {
      // Get.offAndToNamed(Pages.verifyAndSetup);
    }
  }

  Future<void> setMembersInfo() async {
    int _memberId =
        _authenticationRepository.authenticationObs.value.id?.toInt() ?? 0;
    await _membersRepository.getMember(id: _memberId);
    await _membersRepository.getAvatar();
  }

  Future<void> getAccountInfoByMember() async {
    await getAccountByMember(membersId: authenticationObs.value.id);
  }
}
