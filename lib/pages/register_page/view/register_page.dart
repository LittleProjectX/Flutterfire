import 'package:flutter/material.dart';
import 'package:frentalk_app/global_controllers/auth_controller.dart';
import 'package:frentalk_app/pages/register_page/controllers/register_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class RegisPage extends StatelessWidget {
  const RegisPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    final regisC = Get.find<RegisController>();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      height: 400,
                      child: Lottie.asset('assets/lotties/register.json'),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 320,
                        ),
                        Text(
                          'Create your Account',
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
                          controller: regisC.emailC,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => TextField(
                            autocorrect: false,
                            autofocus: false,
                            obscureText: regisC.obScurePass.value,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  regisC.obScurePass.toggle();
                                },
                                icon: Icon(regisC.obScurePass.isTrue
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined),
                              ),
                              label: Text('Password'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            controller: regisC.passC,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => TextField(
                            autocorrect: false,
                            autofocus: false,
                            obscureText: regisC.obScureConfPass.value,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  regisC.obScureConfPass.toggle();
                                },
                                icon: Icon(regisC.obScureConfPass.isTrue
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined),
                              ),
                              label: Text('Confirm Password'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            controller: regisC.confimPassC,
                          ),
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
                              authC.register(
                                regisC.emailC.text,
                                regisC.passC.text,
                                regisC.confimPassC.text,
                              );
                            },
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 2,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
                                regisC.emailC.clear();
                                regisC.passC.clear();
                                regisC.confimPassC.clear();
                                Get.back();
                              },
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xff5E1675)),
                              ),
                            )
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
