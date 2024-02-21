import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

import '../../../domain/repositories/mixins/authentication.dart';
import '../../constants/api.dart';
import 'client_interface.dart';

class AppClient extends ClientInterface with AuthenticationMixin {
  AppClient({super.headers});

  void _forceLogout() {
    //TODO logout
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    try {
      request.headers.addAll(headers?.call() ?? {});

      return request.send().timeout(const Duration(minutes: 2));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StreamedResponse> sendMultiPartForm(
    BaseRequest request, {
    Map<String, String>? fields,
    List<int>? fileBytes,
    String? filePath,
    String? fileFieldName,
    MediaType? contentType,
  }) async {
    try {
      final multipartRequest = MultipartRequest(request.method, request.url);
      final mime = contentType?.mimeType ?? 'png';
      multipartRequest.headers.addAll(headers?.call() ?? {});
      final millisecondsSinceEpoch = kIsWeb
          ? 'test.${mime.split('/').last}'
          : '${DateTime.now().millisecondsSinceEpoch}.${filePath?.split('.').last}';
      multipartRequest.fields.addAll(fields ?? {});
      kIsWeb
          ? multipartRequest.files.add(
              MultipartFile.fromBytes(
                fileFieldName ?? 'File',
                fileBytes ?? [0, 0, 0, 0, 0, 0, 0, 0],
                filename: millisecondsSinceEpoch,
                contentType: contentType,
              ),
            )
          : multipartRequest.files.add(
              await MultipartFile.fromPath(
                fileFieldName ?? 'File',
                filePath ?? '',
                filename: millisecondsSinceEpoch,
                contentType: contentType,
              ),
            );

      return multipartRequest.send().timeout(const Duration(minutes: 2));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<T?> sendRequest<T>(
    Request Function() request,
    T? Function(Response) responseHandler, {
    bool forceCall = false,
  }) async {
    if (!isUserLoggedIn && forceCall == false) {
      return null;
    }

    final _request = request();
    final streamed = await send(_request);
    final response = await Response.fromStream(streamed);
    final treatableStatus = ErrorCode.fromInt(response.statusCode);
    debugPrint(response.body);

    switch (treatableStatus) {
      case null:
        break;
      case ErrorCode.status401:
        _forceLogout();
        return responseHandler(response);
      case ErrorCode.status403:
        _forceLogout();
        return null;
      case ErrorCode.status429:
        _forceLogout();
        return null;
      case ErrorCode.status400:
      case ErrorCode.status404:
      case ErrorCode.status409:
      case ErrorCode.status500:
      case ErrorCode.status502:
      case ErrorCode.status503:
      case ErrorCode.status504:
        debugPrint(
          '${response.body} -> ${response.request?.url.toString() ?? ''}',
        );
    }

    return responseHandler(response);
  }

  @override
  Future<T?> sendRequestMultiPartForm<T>(
    Request Function() request,
    T? Function(Response) responseHandler, {
    Map<String, String>? fields,
    List<int>? fileBytes,
    String? filePath,
    String? fileFieldName,
    MediaType? contentType,
    bool forceCall = false,
  }) async {
    if (!isUserLoggedIn && forceCall == false) {
      return null;
    }
    if (_checkFileProps(filePath, fileBytes)) {
      return responseHandler(Response('Invalid File', 401));
    }

    final _request = request();
    final streamed = await sendMultiPartForm(
      _request,
      fileBytes: fileBytes,
      filePath: filePath,
      contentType: contentType,
      fileFieldName: fileFieldName,
      fields: fields,
    );
    final response = await Response.fromStream(streamed);
    final treatableStatus = ErrorCode.fromInt(response.statusCode);

    switch (treatableStatus) {
      case null:
        break;
      case ErrorCode.status401:
        return responseHandler(response);
      case ErrorCode.status403:
        _forceLogout();
        return null;
      case ErrorCode.status429:
        _forceLogout();
        return null;
      case ErrorCode.status400:
      case ErrorCode.status404:
      case ErrorCode.status409:
      case ErrorCode.status500:
      case ErrorCode.status502:
      case ErrorCode.status503:
      case ErrorCode.status504:
        debugPrint(
          '${response.body} -> ${response.request?.url.toString() ?? ''}',
        );
    }

    return responseHandler(response);
  }
}

// Guard Clauses, true rejects query to server
bool _checkFileProps([String? filePath, List<int>? fileBytes]) {
  try {
    if (kIsWeb) {
      final int _bitsNum = fileBytes?.length ?? 0;
      if (fileBytes?.isEmpty ?? false) {
        return true;
      }
      //file is greater than 1byte and lower than 15 mb (125,829,120)
      final bool _correctBits =
          _bitsNum > 8 && (_bitsNum <= 12.6e+7) ? true : false;
      debugPrint('bits length before send - api client: $_bitsNum');
      if (!_correctBits) {
        return true;
      }
    } else {
      if (filePath?.isEmpty ?? false) {
        return true;
      }
    }

    return false;
  } catch (e) {
    debugPrint('checkFileProps Error: $e');
    return false;
  }
}
