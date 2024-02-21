import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/document_info.dart';

class DocumentInfoUseCase extends DocumentInfoEntity {
  const DocumentInfoUseCase({
    super.id,
    super.isDeleted,
    super.changedOn,
    super.tokensIdChangedBy,
    super.accountId,
    super.accountIdRecipient,
    super.invitationPhone,
    super.invitationName,
    super.metasId,
    super.filesIdPdf,
    super.filesIdSignature,
    super.status,
    super.statusRecipient,
    super.pdfUrl,
  });

  factory DocumentInfoUseCase.fromJson(Map<String, dynamic> json) {
    final _documentInfo = json['DocumentInfo'] as Map<String, dynamic>;
    return DocumentInfoUseCase(
      id: ParseFromDynamic.toInt(input: _documentInfo['Id']),
      isDeleted: ParseFromDynamic.toBool(input: _documentInfo['IsDeleted']),
      changedOn: DateTime.tryParse(
        ParseFromDynamic.parseToString(input: _documentInfo['ChangedOn']) ?? '',
      ),
      tokensIdChangedBy:
          ParseFromDynamic.toInt(input: _documentInfo['TokensId_ChangedBy']),
      accountId: ParseFromDynamic.toInt(input: _documentInfo['AccountId']),
      accountIdRecipient:
          ParseFromDynamic.toInt(input: _documentInfo['AccountId_Recipient']),
      invitationPhone: ParseFromDynamic.parseToString(
          input: _documentInfo['InvitationPhone']),
      invitationName: ParseFromDynamic.parseToString(
          input: _documentInfo['InvitationName']),
      metasId: ParseFromDynamic.toInt(input: _documentInfo['MetasId']),
      filesIdPdf: ParseFromDynamic.toInt(input: _documentInfo['FilesId_Pdf']),
      filesIdSignature:
          ParseFromDynamic.toInt(input: _documentInfo['FilesId_Signature']),
      status: ParseFromDynamic.parseToString(input: _documentInfo['Status']),
      statusRecipient: ParseFromDynamic.parseToString(
          input: _documentInfo['StatusRecipient']),
      pdfUrl: ParseFromDynamic.parseToString(input: _documentInfo['PdfUrl']),
    );
  }

  @override
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
  }) {
    return DocumentInfoUseCase(
      id: id ?? super.id,
      isDeleted: isDeleted ?? super.isDeleted,
      changedOn: changedOn ?? super.changedOn,
      tokensIdChangedBy: tokensIdChangedBy ?? super.tokensIdChangedBy,
      accountId: accountId ?? super.accountId,
      accountIdRecipient: accountIdRecipient ?? super.accountIdRecipient,
      invitationPhone: invitationPhone ?? super.invitationPhone,
      invitationName: invitationName ?? super.invitationName,
      metasId: metasId ?? super.metasId,
      filesIdPdf: filesIdPdf ?? super.filesIdPdf,
      filesIdSignature: filesIdSignature ?? super.filesIdSignature,
      status: status ?? super.status,
      statusRecipient: statusRecipient ?? super.statusRecipient,
      pdfUrl: pdfUrl ?? super.pdfUrl,
    );
  }
}
