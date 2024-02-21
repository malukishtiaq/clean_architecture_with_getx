abstract class AuthenticationEntity {
  const AuthenticationEntity({
    this.id,
    this.isAuthenticated,
    this.authenticatedOn,
    this.accessToken,
    this.invalidLogins,
    this.isLockedOut,
    this.lockedOutExpiresOn,
    this.fileGuid,
    this.httpErrorCode,
    this.httpErrorMessage,
  });

  final int? id;
  final bool? isAuthenticated;
  final String? authenticatedOn;
  final String? accessToken;
  final int? invalidLogins;
  final bool? isLockedOut;
  final String? lockedOutExpiresOn;
  final String? fileGuid;
  final int? httpErrorCode;
  final String? httpErrorMessage;

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
  });
}
