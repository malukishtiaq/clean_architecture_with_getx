import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/state.dart';

class StateUseCase extends StateEntity {
  StateUseCase({
    super.recordCount,
    super.id,
    super.code,
    super.description,
    super.groupName,
  });

  factory StateUseCase.fromJson(Map<String, dynamic> json) => StateUseCase(
        recordCount: ParseFromDynamic.toInt(input: json['RecordCount']),
        id: ParseFromDynamic.toInt(input: json['Id']),
        code: ParseFromDynamic.parseToString(input: json['Code']),
        description: ParseFromDynamic.parseToString(input: json['Description']),
        groupName: ParseFromDynamic.parseToString(input: json['GroupName']),
      );

  @override
  StateUseCase copyWith({
    int? recordCount,
    int? id,
    String? code,
    String? description,
    String? groupName,
  }) =>
      StateUseCase(
        recordCount: recordCount ?? this.recordCount,
        id: id ?? this.id,
        code: code ?? this.code,
        description: description ?? this.description,
        groupName: groupName ?? this.groupName,
      );
}
