import '../../constants/api.dart';
import '../interface/data_interface.dart';
import '../request/auth_request.dart';
import 'envirement_api.dart';

mixin AuthClient on DataInterface, EnvironmentApi {
  AuthRequest get({
    String path = '/',
    String? query,
  }) {
    return AuthRequest(
      uri: fromEnvironment(
        url: route + path,
        query: query,
      ),
      method: Methods.get,
    );
  }

  AuthRequest post({
    String path = '/',
    String? query,
  }) {
    return AuthRequest(
      uri: fromEnvironment(
        url: route + path,
        query: query,
      ),
      method: Methods.post,
    );
  }

  AuthRequest delete({
    String path = '/',
    String? query,
  }) {
    return AuthRequest(
      uri: fromEnvironment(
        url: route + path,
        query: query,
      ),
      method: Methods.delete,
    );
  }

  AuthRequest patch({
    String path = '/',
    String? query,
  }) {
    return AuthRequest(
      uri: fromEnvironment(
        url: route + path,
        query: query,
      ),
      method: Methods.patch,
    );
  }
}
