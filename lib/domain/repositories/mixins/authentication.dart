import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../entities/authentication.dart';
import '../authentication.dart';

mixin AuthenticationMixin {
  final _authenticationRepository = AuthenticationRepository();

  Rx<AuthenticationEntity> get authenticationObs =>
      _authenticationRepository.authenticationObs;

  bool get isUserLoggedIn =>
      //TODO validate accesstoken
      /*_authenticationRepository
              .authenticationObs.value.accessToken?.isNotEmpty ==
          true &&*/
      _authenticationRepository.authenticationObs.value.isAuthenticated == true;

  Future<void> Function() get logout => _authenticationRepository.logout;
  Future<void> Function() get deleteLocalAccountData =>
      _authenticationRepository.deleteLocalAccountData;
}
