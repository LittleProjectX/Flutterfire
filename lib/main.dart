import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:frentalk_app/global_controllers/auth_controller.dart';
import 'package:frentalk_app/pages/add_page/controllers/add_controller.dart';
import 'package:frentalk_app/pages/home_page/controllers/home_controller.dart';
import 'package:frentalk_app/pages/login_page.dart/controllers/login_controller.dart';
import 'package:frentalk_app/pages/register_page/controllers/register_controller.dart';
import 'package:frentalk_app/pages/reset_page/controllers/reset_controller.dart';
import 'package:frentalk_app/routes/app_route.dart';
import 'package:frentalk_app/routes/name_route.dart';
import 'package:frentalk_app/utils/loading_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final authC = Get.put(AuthController());
  final loginC = Get.put(LoginController());
  final regisC = Get.put(RegisController());
  final resetC = Get.put(ResetController());
  final addUserC = Get.put(AddUserController());
  final homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            theme: ThemeData(
                textTheme: GoogleFonts.latoTextTheme(),
                appBarTheme: AppBarTheme(
                    backgroundColor: Color(0xff5E1675),
                    titleTextStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
            debugShowCheckedModeBanner: false,
            initialRoute:
                snapshot.data != null && snapshot.data!.emailVerified == true
                    ? RouteNames.home
                    : RouteNames.login,
            getPages: AppRoutes.pages,
          );
        }
        return LoadingView();
      },
    );
  }
}
