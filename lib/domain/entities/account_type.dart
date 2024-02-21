abstract class AccountTypeEntity {
  const AccountTypeEntity({
    this.recordCount,
    this.id,
    this.code,
    this.description,
    this.groupName,
  });

  final int? recordCount;
  final int? id;
  final String? code;
  final String? description;
  final String? groupName;

  AccountTypeEntity copyWith({
    final int? recordCount,
    final int? id,
    final String? code,
    final String? description,
    final String? groupName,
  });
}
