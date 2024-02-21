import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/member.dart';

class MemberUseCase extends MemberEntity {
  const MemberUseCase({
    super.id,
    super.isDeleted,
    super.changedOn,
    super.tokensIdChangedBy,
    super.userName,
    super.firstName,
    super.lastName,
    super.phoneCountryCode,
    super.phoneNo,
    super.country,
    super.email,
    super.password,
    super.filesIdAvatar,
    super.socialFacebookId,
    super.socialFacebookToken,
    super.socialLinkedInId,
    super.socialLinkedInToken,
    super.socialGmailId,
    super.socialAppleId,
    super.accessToken,
    super.isActive,
    super.authenticatedOn,
    super.isAuthenticated,
    super.invalidLogins,
    super.isLockedOut,
    super.lockedOutExpiresOn,
    super.otpEmail,
    super.otpSms,
    super.isEmailVerified,
    super.isPhoneVerified,
    super.settingsFaceId,
    super.settingsNotifications,
    super.avatar,
  });

  factory MemberUseCase.fromJson(Map<String, dynamic> json) {
    final memberInfo = json['MemberInfo'] as Map<String, dynamic>;

    return MemberUseCase(
      id: ParseFromDynamic.toInt(input: memberInfo['Id']),
      isDeleted: ParseFromDynamic.toBool(input: memberInfo['IsDeleted']),
      changedOn: DateTime.tryParse(
        ParseFromDynamic.parseToString(input: memberInfo['ChangedOn']) ?? '',
      ),
      tokensIdChangedBy:
          ParseFromDynamic.toInt(input: memberInfo['TokensId_ChangedBy']),
      userName: ParseFromDynamic.parseToString(input: memberInfo['UserName']),
      firstName: ParseFromDynamic.parseToString(input: memberInfo['FirstName']),
      lastName: ParseFromDynamic.parseToString(input: memberInfo['LastName']),
      phoneCountryCode:
          ParseFromDynamic.parseToString(input: memberInfo['PhoneCountryCode']),
      phoneNo: ParseFromDynamic.parseToString(input: memberInfo['PhoneNo']),
      country: ParseFromDynamic.parseToString(input: memberInfo['Country']),
      email: ParseFromDynamic.parseToString(input: memberInfo['Email']),
      password: ParseFromDynamic.parseToString(input: memberInfo['Password']),
      filesIdAvatar:
          ParseFromDynamic.toInt(input: memberInfo['FilesId_Avatar']),
      socialFacebookId:
          ParseFromDynamic.parseToString(input: memberInfo['SocialFacebookId']),
      socialFacebookToken: ParseFromDynamic.parseToString(
        input: memberInfo['SocialFacebookToken'],
      ),
      socialLinkedInId:
          ParseFromDynamic.parseToString(input: memberInfo['SocialLinkedInId']),
      socialLinkedInToken: ParseFromDynamic.parseToString(
        input: memberInfo['SocialLinkedInToken'],
      ),
      socialGmailId:
          ParseFromDynamic.parseToString(input: memberInfo['SocialGmailId']),
      socialAppleId:
          ParseFromDynamic.parseToString(input: memberInfo['SocialAppleId']),
      accessToken:
          ParseFromDynamic.parseToString(input: memberInfo['AccessToken']),
      isActive: ParseFromDynamic.toBool(input: memberInfo['IsActive']),
      authenticatedOn:
          ParseFromDynamic.parseToString(input: memberInfo['AuthenticatedOn']),
      isAuthenticated:
          ParseFromDynamic.toBool(input: memberInfo['IsAuthenticated']),
      invalidLogins: ParseFromDynamic.toInt(input: memberInfo['InvalidLogins']),
      isLockedOut: ParseFromDynamic.toBool(input: memberInfo['IsLockedOut']),
      lockedOutExpiresOn: ParseFromDynamic.parseToString(
        input: memberInfo['LockedOutExpiresOn'],
      ),
      otpEmail: ParseFromDynamic.parseToString(
        input: memberInfo['OtpEmail'],
      ),
      otpSms: ParseFromDynamic.parseToString(
        input: memberInfo['OtpSms'],
      ),
      isEmailVerified:
          ParseFromDynamic.toBool(input: memberInfo['IsEmailVerified']),
      isPhoneVerified:
          ParseFromDynamic.toBool(input: memberInfo['IsPhoneVerified']),
      settingsFaceId:
          ParseFromDynamic.toBool(input: memberInfo['SettingsFaceId']),
      settingsNotifications:
          ParseFromDynamic.toBool(input: memberInfo['SettingsNotifications']),
    );
  }

  @override
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
  }) {
    return MemberUseCase(
      id: id ?? super.id,
      isDeleted: isDeleted ?? super.isDeleted,
      changedOn: changedOn ?? super.changedOn,
      tokensIdChangedBy: tokensIdChangedBy ?? super.tokensIdChangedBy,
      userName: userName ?? super.userName,
      firstName: firstName ?? super.firstName,
      lastName: lastName ?? super.lastName,
      phoneCountryCode: phoneCountryCode ?? super.phoneCountryCode,
      phoneNo: phoneNo ?? super.phoneNo,
      country: country ?? super.country,
      email: email ?? super.email,
      password: password ?? super.password,
      filesIdAvatar: filesIdAvatar ?? super.filesIdAvatar,
      socialFacebookId: socialFacebookId ?? super.socialFacebookId,
      socialFacebookToken: socialFacebookToken ?? super.socialFacebookToken,
      socialLinkedInId: socialLinkedInId ?? super.socialLinkedInId,
      socialLinkedInToken: socialLinkedInToken ?? super.socialLinkedInToken,
      socialGmailId: socialGmailId ?? super.socialGmailId,
      socialAppleId: socialAppleId ?? super.socialAppleId,
      accessToken: accessToken ?? super.accessToken,
      isActive: isActive ?? super.isActive,
      authenticatedOn: authenticatedOn ?? super.authenticatedOn,
      isAuthenticated: isAuthenticated ?? super.isAuthenticated,
      invalidLogins: invalidLogins ?? super.invalidLogins,
      isLockedOut: isLockedOut ?? super.isLockedOut,
      lockedOutExpiresOn: lockedOutExpiresOn ?? super.lockedOutExpiresOn,
      otpEmail: otpEmail ?? super.otpEmail,
      otpSms: otpSms ?? super.otpSms,
      isEmailVerified: isEmailVerified ?? super.isEmailVerified,
      isPhoneVerified: isPhoneVerified ?? super.isPhoneVerified,
      settingsFaceId: settingsFaceId ?? super.settingsFaceId,
      settingsNotifications:
          settingsNotifications ?? super.settingsNotifications,
      avatar: avatar ?? super.avatar,
    );
  }
}
