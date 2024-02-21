abstract class UploadFileEntity {
  //TODO DIEGO REFACTOR THIS?
  const UploadFileEntity({
    this.id,
    this.isDeleted,
    this.changedOn,
    this.tokensIdChangedBy,
    this.metasId,
    this.originalName,
    this.fileRepo,
    this.folder,
    this.guid,
    this.fileUrl,
    this.description,
    this.mimeType,
  });

  final int? id;
  final bool? isDeleted;
  final DateTime? changedOn;
  final int? tokensIdChangedBy;
  final int? metasId;
  final String? originalName;
  final String? fileRepo;
  final String? folder;
  final String? guid;
  final String? fileUrl;
  final String? description;
  final String? mimeType;

  UploadFileEntity copyWith({
    final int? id,
    final bool? isDeleted,
    final DateTime? changedOn,
    final int? tokensIdChangedBy,
    final int? metasId,
    final String? originalName,
    final String? fileRepo,
    final String? folder,
    final String? guid,
    final String? fileUrl,
    final String? description,
    final String? mimeType,
  });
}
