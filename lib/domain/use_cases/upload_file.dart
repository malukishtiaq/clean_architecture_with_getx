import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/upload_file.dart';

class UploadFileUseCase extends UploadFileEntity {
  const UploadFileUseCase({
    super.id,
    super.isDeleted,
    super.changedOn,
    super.tokensIdChangedBy,
    super.metasId,
    super.originalName,
    super.fileRepo,
    super.folder,
    super.guid,
    super.fileUrl,
    super.description,
    super.mimeType,
  });

  factory UploadFileUseCase.fromJson(Map<String, dynamic> json) {
    final fileInfo = json['FileInfo'] as Map<String, dynamic>;

    return UploadFileUseCase(
      id: ParseFromDynamic.toInt(input: fileInfo['Id']),
      isDeleted: ParseFromDynamic.toBool(input: fileInfo['IsDeleted']),
      changedOn: DateTime.tryParse(
        ParseFromDynamic.parseToString(input: fileInfo['ChangedOn']) ?? '',
      ),
      tokensIdChangedBy:
          ParseFromDynamic.toInt(input: fileInfo['TokensId_ChangedBy']),
      metasId: ParseFromDynamic.toInt(input: fileInfo['MetasId']),
      originalName:
          ParseFromDynamic.parseToString(input: fileInfo['OriginalName']),
      fileRepo: ParseFromDynamic.parseToString(input: fileInfo['FileRepo']),
      folder: ParseFromDynamic.parseToString(input: fileInfo['Folder']),
      guid: ParseFromDynamic.parseToString(input: fileInfo['Guid']),
      fileUrl: ParseFromDynamic.parseToString(input: fileInfo['FileUrl']),
      description:
          ParseFromDynamic.parseToString(input: fileInfo['Description']),
      mimeType: ParseFromDynamic.parseToString(input: fileInfo['MimeType']),
    );
  }

  @override
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
  }) {
    return UploadFileUseCase(
      id: id ?? super.id,
      isDeleted: isDeleted ?? super.isDeleted,
      changedOn: changedOn ?? super.changedOn,
      tokensIdChangedBy: tokensIdChangedBy ?? super.tokensIdChangedBy,
      metasId: metasId ?? super.metasId,
      originalName: originalName ?? super.originalName,
      fileRepo: fileRepo ?? super.fileRepo,
      folder: folder ?? super.folder,
      guid: guid ?? super.guid,
      fileUrl: fileUrl ?? super.fileUrl,
      description: description ?? super.description,
      mimeType: mimeType ?? super.mimeType,
    );
  }
}
