enum ErrorCode {
  status400,
  status401,
  status403,
  status404,
  status409,
  status429,
  status500,
  status502,
  status503,
  status504;

  int get value => int.tryParse(name.replaceAll(RegExp(r'\W+'), '')) ?? 500;

  static ErrorCode? fromInt(int i) {
    switch (i) {
      case 400:
        return ErrorCode.status400;
      case 401:
        return ErrorCode.status401;
      case 403:
        return ErrorCode.status403;
      case 404:
        return ErrorCode.status404;
      case 409:
        return ErrorCode.status409;
      case 500:
        return ErrorCode.status500;
      case 502:
        return ErrorCode.status502;
      case 503:
        return ErrorCode.status503;
      case 504:
        return ErrorCode.status504;
      default:
        return null;
    }
  }
}

enum Methods {
  get,
  post,
  patch,
  delete;

  String get name {
    switch (this) {
      case Methods.get:
        return 'GET';
      case Methods.post:
        return 'POST';
      case Methods.patch:
        return 'PATCH';
      case Methods.delete:
        return 'DELETE';
    }
  }
}
