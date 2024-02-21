import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/account_type.dart';

class AccountTypeUseCase extends AccountTypeEntity {
  AccountTypeUseCase({
    super.recordCount,
    super.id,
    super.code,
    super.description,
    super.groupName,
  });

  factory AccountTypeUseCase.fromJson(Map<String, dynamic> json) =>
      AccountTypeUseCase(
        recordCount: ParseFromDynamic.toInt(input: json['RecordCount']),
        id: ParseFromDynamic.toInt(input: json['Id']),
        code: ParseFromDynamic.parseToString(input: json['Code']),
        description: ParseFromDynamic.parseToString(input: json['Description']),
        groupName: ParseFromDynamic.parseToString(input: json['GroupName']),
      );

  @override
  AccountTypeUseCase copyWith({
    int? recordCount,
    int? id,
    String? code,
    String? description,
    String? groupName,
  }) =>
      AccountTypeUseCase(
        recordCount: recordCount ?? this.recordCount,
        id: id ?? this.id,
        code: code ?? this.code,
        description: description ?? this.description,
        groupName: groupName ?? this.groupName,
      );
}
