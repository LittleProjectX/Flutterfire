import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisController extends GetxController {
  var obScurePass = true.obs;
  var obScureConfPass = true.obs;
  late TextEditingController emailC;
  late TextEditingController passC;
  late TextEditingController confimPassC;

  @override
  void onInit() {
    emailC = TextEditingController();
    passC = TextEditingController();
    confimPassC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    confimPassC.dispose();
    super.onClose();
  }
}
