import 'dart:convert';
import 'package:get/get.dart';
import '../../app/api/api_export.dart';

class MembersSaveSettingsApi extends DataInterface
    with EnvironmentApi, AuthClient {
  factory MembersSaveSettingsApi() {
    if (Get.isRegistered<MembersSaveSettingsApi>()) {
      return Get.find<MembersSaveSettingsApi>();
    } else {
      return Get.put(
        MembersSaveSettingsApi._(),
      );
    }
  }

  MembersSaveSettingsApi._();

  @override
  String get route => '/Members';

  AuthRequest saveSettings({
    int? id,
    bool? settingsFaceId,
    bool? settingsNotifications,
  }) {
    final request = patch(path: '/SaveSettings');

    request.body = jsonEncode({
      'MembersId': id,
      'SettingsFaceId': settingsFaceId,
      'SettingsNotifications': settingsNotifications,
    });

    return request;
  }
}
