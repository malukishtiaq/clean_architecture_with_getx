import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

abstract class ClientInterface extends BaseClient {
  ClientInterface({
    this.retry = false,
    this.attempts = 0,
    this.headers,
  });

  bool retry;
  int attempts;

  final Map<String, String> Function()? headers;

  @override
  Future<StreamedResponse> send(BaseRequest request);

  Future<StreamedResponse> sendMultiPartForm(
    BaseRequest request, {
    Map<String, String>? fields,
    List<int>? fileBytes,
    String? filePath,
    String? fileFieldName,
    MediaType? contentType,
  });

  Future<T?> sendRequest<T>(
    Request Function() request,
    T? Function(Response) responseHandler,
  );

  Future<T?> sendRequestMultiPartForm<T>(
    Request Function() request,
    T? Function(Response) responseHandler, {
    Map<String, String>? fields,
    List<int>? fileBytes,
    String? filePath,
    String? fileFieldName,
    MediaType? contentType,
    bool forceCall = false,
  });
}
