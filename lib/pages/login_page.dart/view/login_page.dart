import 'package:flutter/material.dart';
import 'package:frentalk_app/global_controllers/auth_controller.dart';
import 'package:frentalk_app/pages/login_page.dart/controllers/login_controller.dart';
import 'package:frentalk_app/routes/name_route.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    final loginC = Get.find<LoginController>();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Center(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 400,
                      child: Lottie.asset('assets/lotties/login.json'),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 320,
                        ),
                        Text(
                          'Login to your Account',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          autocorrect: false,
                          autofocus: false,
                          decoration: InputDecoration(
                            label: Text('Email'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          controller: loginC.emailC,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => TextField(
                            autocorrect: false,
                            autofocus: false,
                            obscureText: loginC.obScurePass.value,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  loginC.obScurePass.toggle();
                                },
                                icon: Icon(loginC.obScurePass.isTrue
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined),
                              ),
                              label: Text('Password'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            controller: loginC.passC,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  Get.toNamed(RouteNames.reset);
                                },
                                child: Text('Forgot password !'))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff5E1675),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              authC.login(
                                  loginC.emailC.text, loginC.passC.text);
                            },
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 2,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an Account?',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            TextButton(
                              onPressed: () {
                                loginC.emailC.clear();
                                loginC.passC.clear();
                                Get.toNamed(RouteNames.register);
                              },
                              child: Text(
                                'REGISTER',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xff5E1675)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
