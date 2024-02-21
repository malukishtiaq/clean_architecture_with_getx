import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/authentication.dart';

class AuthenticationUseCase extends AuthenticationEntity {
  const AuthenticationUseCase({
    super.id,
    super.isAuthenticated,
    super.authenticatedOn,
    super.accessToken,
    super.invalidLogins,
    super.isLockedOut,
    super.lockedOutExpiresOn,
    super.fileGuid,
    super.httpErrorCode,
    super.httpErrorMessage,
  });

  factory AuthenticationUseCase.fromJson(Map<String, dynamic> json) {
    final authentication = json['Authentication'] as Map<String, dynamic>;

    return AuthenticationUseCase(
      id: ParseFromDynamic.toInt(input: authentication['Id']),
      isAuthenticated:
          ParseFromDynamic.toBool(input: authentication['IsAuthenticated']),
      authenticatedOn: ParseFromDynamic.parseToString(
        input: authentication['AuthenticatedOn'],
      ),
      accessToken:
          ParseFromDynamic.parseToString(input: authentication['AccessToken']),
      invalidLogins:
          ParseFromDynamic.toInt(input: authentication['InvalidLogins']),
      isLockedOut:
          ParseFromDynamic.toBool(input: authentication['IsLockedOut']),
      lockedOutExpiresOn: ParseFromDynamic.parseToString(
        input: authentication['LockedOutExpiresOn'],
      ),
      fileGuid:
          ParseFromDynamic.parseToString(input: authentication['FileGuid']),
      httpErrorCode:
          ParseFromDynamic.toInt(input: authentication['HttpErrorCode']),
      httpErrorMessage: ParseFromDynamic.parseToString(
        input: authentication['HttpErrorMessage'],
      ),
    );
  }

  @override
  AuthenticationEntity copyWith({
    final int? id,
    final bool? isAuthenticated,
    final String? authenticatedOn,
    final String? accessToken,
    final int? invalidLogins,
    final bool? isLockedOut,
    final String? lockedOutExpiresOn,
    final String? fileGuid,
    final int? httpErrorCode,
    final String? httpErrorMessage,
  }) {
    return AuthenticationUseCase(
      id: id ?? super.id,
      isAuthenticated: isAuthenticated ?? super.isAuthenticated,
      authenticatedOn: authenticatedOn ?? super.authenticatedOn,
      accessToken: accessToken ?? super.accessToken,
      invalidLogins: invalidLogins ?? super.invalidLogins,
      isLockedOut: isLockedOut ?? super.isLockedOut,
      lockedOutExpiresOn: lockedOutExpiresOn ?? super.lockedOutExpiresOn,
      fileGuid: fileGuid ?? super.fileGuid,
      httpErrorCode: httpErrorCode ?? super.httpErrorCode,
      httpErrorMessage: httpErrorMessage ?? super.httpErrorMessage,
    );
  }
}
