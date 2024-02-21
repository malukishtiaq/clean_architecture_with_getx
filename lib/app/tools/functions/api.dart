import 'package:http/http.dart';

bool isSuccessResponse(Response response) {
  return response.statusCode >= 200 && response.statusCode < 300;
}
