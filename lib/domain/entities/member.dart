abstract class MemberEntity {
  const MemberEntity({
    this.id,
    this.isDeleted,
    this.changedOn,
    this.tokensIdChangedBy,
    this.userName,
    this.firstName,
    this.lastName,
    this.phoneCountryCode,
    this.phoneNo,
    this.country,
    this.email,
    this.password,
    this.filesIdAvatar,
    this.socialFacebookId,
    this.socialFacebookToken,
    this.socialLinkedInId,
    this.socialLinkedInToken,
    this.socialGmailId,
    this.socialAppleId,
    this.accessToken,
    this.isActive,
    this.authenticatedOn,
    this.isAuthenticated,
    this.invalidLogins,
    this.isLockedOut,
    this.lockedOutExpiresOn,
    this.otpEmail,
    this.otpSms,
    this.isEmailVerified,
    this.isPhoneVerified,
    this.settingsFaceId,
    this.settingsNotifications,
    this.avatar,
  });

  final int? id;
  final bool? isDeleted;
  final DateTime? changedOn;
  final int? tokensIdChangedBy;
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String? phoneCountryCode;
  final String? phoneNo;
  final String? country;
  final String? email;
  final String? password;
  final int? filesIdAvatar;
  final String? socialFacebookId;
  final String? socialFacebookToken;
  final String? socialLinkedInId;
  final String? socialLinkedInToken;
  final String? socialGmailId;
  final String? socialAppleId;
  final String? accessToken;
  final bool? isActive;
  final String? authenticatedOn;
  final bool? isAuthenticated;
  final int? invalidLogins;
  final bool? isLockedOut;
  final String? lockedOutExpiresOn;
  final String? otpEmail;
  final String? otpSms;
  final bool? isEmailVerified;
  final bool? isPhoneVerified;
  final bool? settingsFaceId;
  final bool? settingsNotifications;
  final String? avatar;

  MemberEntity copyWith({
    final int? id,
    final bool? isDeleted,
    final DateTime? changedOn,
    final int? tokensIdChangedBy,
    final String? userName,
    final String? firstName,
    final String? lastName,
    final String? phoneCountryCode,
    final String? phoneNo,
    final String? country,
    final String? email,
    final String? password,
    final int? filesIdAvatar,
    final String? socialFacebookId,
    final String? socialFacebookToken,
    final String? socialLinkedInId,
    final String? socialLinkedInToken,
    final String? socialGmailId,
    final String? socialAppleId,
    final String? accessToken,
    final bool? isActive,
    final String? authenticatedOn,
    final bool? isAuthenticated,
    final int? invalidLogins,
    final bool? isLockedOut,
    final String? lockedOutExpiresOn,
    final String? otpEmail,
    final String? otpSms,
    final bool? isEmailVerified,
    final bool? isPhoneVerified,
    final bool? settingsFaceId,
    final bool? settingsNotifications,
    final String? avatar,
  });
}
