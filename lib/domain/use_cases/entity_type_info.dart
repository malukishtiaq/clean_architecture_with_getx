import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/entity_type_info.dart';

class EntityTypeInfoUseCase extends EntityTypeInfoEntity {
  const EntityTypeInfoUseCase({
    super.id,
    super.isDeleted,
    super.changedOn,
    super.tokensIdChangedBy,
    super.code,
    super.description,
    super.groupName,
  });

  factory EntityTypeInfoUseCase.fromJson(Map<String, dynamic> json) {
    return EntityTypeInfoUseCase(
      id: ParseFromDynamic.toInt(input: json['Id']),
      isDeleted: ParseFromDynamic.toBool(input: json['IsDeleted']),
      changedOn: DateTime.tryParse(
        ParseFromDynamic.parseToString(input: json['ChangedOn']) ?? '',
      ),
      tokensIdChangedBy:
          ParseFromDynamic.toInt(input: json['TokensId_ChangedBy']),
      code: ParseFromDynamic.parseToString(input: json['Code']),
      description: ParseFromDynamic.parseToString(input: json['Description']),
      groupName: ParseFromDynamic.parseToString(input: json['GroupName']),
    );
  }

  @override
  EntityTypeInfoEntity copyWith({
    final int? id,
    final bool? isDeleted,
    final DateTime? changedOn,
    final int? tokensIdChangedBy,
    final String? code,
    final String? description,
    final String? groupName,
  }) {
    return EntityTypeInfoUseCase(
      id: id ?? this.id,
      isDeleted: isDeleted ?? this.isDeleted,
      changedOn: changedOn ?? this.changedOn,
      tokensIdChangedBy: tokensIdChangedBy ?? this.tokensIdChangedBy,
      code: code ?? this.code,
      description: description ?? this.description,
      groupName: groupName ?? this.groupName,
    );
  }
}
