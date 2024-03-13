import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetController extends GetxController {
  late TextEditingController emailC;

  @override
  void onInit() {
    emailC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailC.dispose();
    super.onClose();
  }
}
