import 'package:get/get.dart';

import '../../entities/member.dart';
import '../members.dart';

mixin MembersMixin {
  final _membersRepository = MembersRepository();

  Rx<MemberEntity> get memberObs => _membersRepository.memberObs;

  Future<String?> Function({
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
  }) get registerMember => _membersRepository.register;

  Future<String?> Function({
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
  }) get updateMember => _membersRepository.updateMember;

  Future<String?> Function({
    required String newPassword,
  }) get updatePassword => _membersRepository.updatePassword;

  Future<bool> Function({
    String? filePath,
    List<int>? fileBytes,
    String? mimeType,
  }) get saveAvatar => _membersRepository.saveAvatar;

  Future<bool?> Function({
    bool? settingsFaceId,
    bool? settingsNotifications,
  }) get saveSettings => _membersRepository.saveSettings;

  Future<bool?> Function() get deleteAccount =>
      _membersRepository.deleteAccount;

  Future<bool?> Function() get deleteData => _membersRepository.deleteData;
}
