abstract class DocumentInfoEntity {
  const DocumentInfoEntity({
    this.id,
    this.isDeleted,
    this.changedOn,
    this.tokensIdChangedBy,
    this.accountId,
    this.accountIdRecipient,
    this.invitationPhone,
    this.invitationName,
    this.metasId,
    this.filesIdPdf,
    this.filesIdSignature,
    this.status,
    this.statusRecipient,
    this.pdfUrl,
  });

  final int? id;
  final bool? isDeleted;
  final DateTime? changedOn;
  final int? tokensIdChangedBy;
  final int? accountId;
  final int? accountIdRecipient;
  final String? invitationPhone;
  final String? invitationName;
  final int? metasId;
  final int? filesIdPdf;
  final int? filesIdSignature;
  final String? status;
  final String? statusRecipient;
  final String? pdfUrl;

  DocumentInfoEntity copyWith({
    final int? id,
    final bool? isDeleted,
    final DateTime? changedOn,
    final int? tokensIdChangedBy,
    final int? accountId,
    final int? accountIdRecipient,
    final String? invitationPhone,
    final String? invitationName,
    final int? metasId,
    final int? filesIdPdf,
    final int? filesIdSignature,
    final String? status,
    final String? statusRecipient,
    final String? pdfUrl,
  });
}
