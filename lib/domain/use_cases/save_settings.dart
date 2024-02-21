import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/save_sattings.dart';

class SaveSettingsUseCase extends SaveSettingsEntity {
  const SaveSettingsUseCase({
    super.status,
  });

  factory SaveSettingsUseCase.fromJson(Map<String, dynamic> json) {
    return SaveSettingsUseCase(
      status: ParseFromDynamic.parseToString(input: json['Status']),
    );
  }

  @override
  SaveSettingsEntity copyWith({
    final String? status,
  }) {
    return SaveSettingsUseCase(
      status: status ?? super.status,
    );
  }
}
