import 'package:frentalk_app/pages/add_page/view/add_page.dart';
import 'package:frentalk_app/pages/edit_page/view/edit_page.dart';
import 'package:frentalk_app/pages/home_page/view/home_page.dart';
import 'package:frentalk_app/pages/login_page.dart/view/login_page.dart';
import 'package:frentalk_app/pages/register_page/view/register_page.dart';
import 'package:frentalk_app/pages/reset_page/view/reset_page.dart';
import 'package:frentalk_app/routes/name_route.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: RouteNames.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: RouteNames.register,
      page: () => RegisPage(),
    ),
    GetPage(
      name: RouteNames.reset,
      page: () => ResetPage(),
    ),
    GetPage(
      name: RouteNames.addUser,
      page: () => AddUserPage(),
    ),
    GetPage(
      name: RouteNames.editUser,
      page: () => EditUserPage(),
    ),
  ];
}
