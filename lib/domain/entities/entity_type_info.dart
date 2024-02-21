abstract class EntityTypeInfoEntity {
  const EntityTypeInfoEntity({
    this.id,
    this.isDeleted,
    this.changedOn,
    this.tokensIdChangedBy,
    this.code,
    this.description,
    this.groupName,
  });

  final int? id;
  final bool? isDeleted;
  final DateTime? changedOn;
  final int? tokensIdChangedBy;
  final String? code;
  final String? description;
  final String? groupName;

  EntityTypeInfoEntity copyWith({
    final int? id,
    final bool? isDeleted,
    final DateTime? changedOn,
    final int? tokensIdChangedBy,
    final String? code,
    final String? description,
    final String? groupName,
  });
}
