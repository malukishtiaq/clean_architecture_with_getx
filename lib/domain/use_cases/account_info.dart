import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/account_info.dart';

class AccountInfoUseCase extends AccountInfoEntity {
  const AccountInfoUseCase({
    super.id,
    super.isDeleted,
    super.changedOn,
    super.tokensIdChangedBy,
    super.membersId,
    super.addressId,
    super.entityTypesId,
    super.statesId,
    super.metasId,
    super.filesIdPdf,
    super.filesIdSignature,
    super.name,
    super.description,
    super.pdfUrl,
  });

  factory AccountInfoUseCase.fromJson(Map<String, dynamic> json) {
    return AccountInfoUseCase(
      id: ParseFromDynamic.toInt(input: json['Id']),
      isDeleted: ParseFromDynamic.toBool(input: json['IsDeleted']),
      changedOn: DateTime.tryParse(
        ParseFromDynamic.parseToString(input: json['ChangedOn']) ?? '',
      ),
      tokensIdChangedBy:
          ParseFromDynamic.toInt(input: json['TokensId_ChangedBy']),
      membersId: ParseFromDynamic.toInt(input: json['MembersId']),
      addressId: ParseFromDynamic.toInt(input: json['AddressId']),
      entityTypesId: ParseFromDynamic.toInt(input: json['EntityTypesId']),
      statesId: ParseFromDynamic.toInt(input: json['StatesId']),
      metasId: ParseFromDynamic.toInt(input: json['MetasId']),
      filesIdPdf: ParseFromDynamic.toInt(input: json['FilesId_Pdf']),
      filesIdSignature:
          ParseFromDynamic.toInt(input: json['FilesId_Signature']),
      name: ParseFromDynamic.parseToString(input: json['Name']),
      description: ParseFromDynamic.parseToString(input: json['Description']),
      pdfUrl: ParseFromDynamic.parseToString(input: json['PdfUrl']),
    );
  }

  @override
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
  }) {
    return AccountInfoUseCase(
      id: id ?? super.id,
      isDeleted: isDeleted ?? super.isDeleted,
      changedOn: changedOn ?? super.changedOn,
      tokensIdChangedBy: tokensIdChangedBy ?? super.tokensIdChangedBy,
      membersId: membersId ?? super.membersId,
      addressId: addressId ?? super.addressId,
      entityTypesId: entityTypesId ?? super.entityTypesId,
      statesId: statesId ?? super.statesId,
      metasId: metasId ?? super.metasId,
      filesIdPdf: filesIdPdf ?? super.filesIdPdf,
      filesIdSignature: filesIdSignature ?? super.filesIdSignature,
      name: name ?? super.name,
      description: description ?? super.description,
      pdfUrl: pdfUrl ?? super.pdfUrl,
    );
  }
}
