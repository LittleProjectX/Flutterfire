import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var obScurePass = true.obs;
  late TextEditingController emailC;
  late TextEditingController passC;

  @override
  void onInit() {
    emailC = TextEditingController();
    passC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
