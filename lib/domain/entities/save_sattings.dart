abstract class SaveSettingsEntity {
  const SaveSettingsEntity({
    this.status,
  });

  final String? status;

  SaveSettingsEntity copyWith({
    final String? status,
  });
}
