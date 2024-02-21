abstract class ApiInvalidEntity {
  const ApiInvalidEntity({
    this.message,
    this.stackTrace,
    this.httpError,
  });

  final String? message;
  final String? stackTrace;
  final int? httpError;

  ApiInvalidEntity copyWith({
    final String? message,
    final String? stackTrace,
    final int? httpError,
  });
}
