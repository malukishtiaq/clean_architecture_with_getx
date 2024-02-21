abstract class AccountInfoEntity {
  const AccountInfoEntity({
    this.id,
    this.isDeleted,
    this.changedOn,
    this.tokensIdChangedBy,
    this.membersId,
    this.addressId,
    this.entityTypesId,
    this.statesId,
    this.metasId,
    this.filesIdPdf,
    this.filesIdSignature,
    this.name,
    this.description,
    this.pdfUrl,
  });

  final int? id;
  final bool? isDeleted;
  final DateTime? changedOn;
  final int? tokensIdChangedBy;
  final int? membersId;
  final int? addressId;
  final int? entityTypesId;
  final int? statesId;
  final int? metasId;
  final int? filesIdPdf;
  final int? filesIdSignature;
  final String? name;
  final String? description;
  final String? pdfUrl;

  AccountInfoEntity copyWith({
    final int? id,
    final bool? isDeleted,
    final DateTime? changedOn,
    final int? tokensIdChangedBy,
    final int? membersId,
    final int? addressId,
    final int? entityTypesId,
    final int? statesId,
    final int? metasId,
    final int? filesIdPdf,
    final int? filesIdSignature,
    final String? name,
    final String? description,
    final String? pdfUrl,
  });
}
