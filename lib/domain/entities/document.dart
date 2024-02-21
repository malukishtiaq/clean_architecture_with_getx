abstract class DocumentEntity {
  const DocumentEntity({
    this.recordCount,
    this.id,
    this.createdOn,
    this.invitationPhone,
    this.invitationName,
    this.filesIdPdf,
  });

  final int? recordCount;
  final int? id;
  final String? createdOn;
  final String? invitationPhone;
  final String? invitationName;
  final int? filesIdPdf;

  DocumentEntity copyWith({
    final int? recordCount,
    final int? id,
    final String? createdOn,
    final String? invitationPhone,
    final String? invitationName,
    final int? filesIdPdf,
  });
}
