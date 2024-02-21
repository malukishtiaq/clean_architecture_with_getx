import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/api_invalid.dart';

class ApiInvalidUseCase extends ApiInvalidEntity {
  const ApiInvalidUseCase({
    super.message,
    super.stackTrace,
    super.httpError,
  });

  factory ApiInvalidUseCase.fromJson(Map<String, dynamic> json) =>
      ApiInvalidUseCase(
        message: ParseFromDynamic.parseToString(input: json['message']),
        stackTrace: ParseFromDynamic.parseToString(input: json['stackTrace']),
        httpError: ParseFromDynamic.toInt(input: json['httpError']),
      );

  @override
  ApiInvalidEntity copyWith({
    final String? message,
    final String? stackTrace,
    final int? httpError,
  }) {
    return ApiInvalidUseCase(
      message: message ?? super.message,
      stackTrace: stackTrace ?? super.stackTrace,
      httpError: httpError ?? super.httpError,
    );
  }
}
