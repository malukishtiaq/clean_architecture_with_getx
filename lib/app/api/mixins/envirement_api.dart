import 'package:flutter/foundation.dart';

mixin EnvironmentApi {
  Uri fromEnvironment({
    required String url,
    String? query,
  }) {
    const baseApiHost = 'api_url.com';
    const basePath = kDebugMode ? '/Services/v2/' : '/Services/v2/';

    final uri = Uri.https(baseApiHost, basePath + url).replace(query: query);

    if (kDebugMode) {
      debugPrint('$uri');
    }
    return uri;
  }
}
