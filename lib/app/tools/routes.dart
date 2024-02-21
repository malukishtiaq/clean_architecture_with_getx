import 'package:get/get.dart';
import '../../features/screen/login/login.dart';

abstract class Pages {
  static List<GetPage> pages = [
    GetPage(
      name: login,
      page: LoginScreen.new,
    ),
  ];

  static const String initialRoute = login;
  static const String login = '/login';
}
