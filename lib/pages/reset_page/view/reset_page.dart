import 'package:flutter/material.dart';
import 'package:frentalk_app/global_controllers/auth_controller.dart';
import 'package:frentalk_app/pages/reset_page/controllers/reset_controller.dart';
import 'package:frentalk_app/routes/name_route.dart';
import 'package:get/get.dart';

class ResetPage extends StatelessWidget {
  const ResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    final resetC = Get.find<ResetController>();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 320,
                    ),
                    Text(
                      'Reset Account',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
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
                      controller: resetC.emailC,
                    ),
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
                          authC.resetPass(resetC.emailC.text);
                        },
                        child: Text(
                          'RESET',
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
                          'Have an Account?',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          onPressed: () {
                            resetC.emailC.clear();
                            Get.toNamed(RouteNames.login);
                          },
                          child: Text(
                            'LOGIN',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
