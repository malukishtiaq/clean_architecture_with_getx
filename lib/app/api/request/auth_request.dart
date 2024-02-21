import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

import '../../../domain/repositories/authentication.dart';
import '../../constants/api.dart';
import '../client/app_client.dart';

class AuthRequest extends Request {
  AuthRequest({
    required this.uri,
    required Methods method,
  })  : methodType = method,
        super(
          method.name,
          uri,
        );

  final Uri uri;
  final Methods methodType;

  final _authenticationRepository = AuthenticationRepository();

  Map<String, String> _createHeaders() {
    final accessToken =
        _authenticationRepository.authenticationObs.value.accessToken;

    if (methodType == Methods.get) {
      return {
        ...headers,
        'AppName': 'DbBee',
        'Authorization':
            'Bearer ${accessToken?.isNotEmpty == true ? accessToken : '14FE34B2-9547-43F5-A57C-F0DC7DE81AA9'}',
      };
    }

    return {
      ...headers,
      'AppName': 'DbBee',
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${accessToken?.isNotEmpty == true ? accessToken : '14FE34B2-9547-43F5-A57C-F0DC7DE81AA9'}',
    };
  }

  Map<String, String> _createHeadersMultiPartForm() {
    final accessToken =
        _authenticationRepository.authenticationObs.value.accessToken;

    return {
      ...headers,
      'AppName': 'DbBee',
      'Authorization':
          'Bearer ${accessToken?.isNotEmpty == true ? accessToken : '14FE34B2-9547-43F5-A57C-F0DC7DE81AA9'}',
    };
  }

  AuthRequest _newInstance() {
    return AuthRequest(
      uri: uri,
      method: methodType,
    )
      ..headers.addAll(headers)
      ..body = body;
  }

  Future<T?> call<T>(
    T? Function(Response) responseHandler, {
    bool forceCall = false,
  }) async {
    final client = AppClient(headers: _createHeaders);
    return client.sendRequest(
      _newInstance,
      responseHandler,
      forceCall: forceCall,
    );
  }

  Future<T?> callMultiPartForm<T>(
    T? Function(Response) responseHandler, {
    Map<String, String>? fields,
    List<int>? fileBytes,
    String? filePath,
    String? fieldName,
    MediaType? contentType,
    bool forceCall = false,
  }) async {
    final client = AppClient(
      headers: _createHeadersMultiPartForm,
    );
    return client.sendRequestMultiPartForm(
      _newInstance,
      responseHandler,
      forceCall: forceCall,
      fileBytes: fileBytes,
      filePath: filePath,
      fileFieldName: fieldName,
      contentType: contentType,
      fields: fields,
    );
  }

  Future<T?> callWithCustomHeaders<T>(
    T? Function(Response) responseHandler, {
    Map<String, String> Function()? headers,
  }) async {
    final client = AppClient(headers: headers);
    return client.sendRequest(
      _newInstance,
      responseHandler,
      forceCall: true,
    );
  }
}
