import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frentalk_app/utils/dialog_satu.dart';

class AddUserController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late TextEditingController nameC;
  late TextEditingController telpC;
  late TextEditingController statusC;

  @override
  void onInit() {
    nameC = TextEditingController();
    telpC = TextEditingController();
    statusC = TextEditingController(text: 'Hi there! i\'m using FrenTalk');
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    telpC.dispose();
    statusC.dispose();
    super.onClose();
  }

  void addUser(String name, String telp, String status) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    if (name.isNotEmpty && telp.isNotEmpty && status.isNotEmpty) {
      try {
        await users.add({
          'name': name,
          'telp': telp,
          'status': status,
        });
        Get.dialog(CustomDialogSatu(
          title: 'PEMBERITAHUAN',
          content: 'Data user berhasil ditambahkan',
          textConfirm: 'OK',
          onConfirm: () {
            nameC.clear();
            telpC.clear();
            statusC.clear();
            Get.back();
            Get.back();
          },
        ));
      } catch (e) {
        Get.dialog(CustomDialogSatu(
          title: 'PEMBERITAHUAN',
          content: 'Terjadi kesalahan, data user tidak berhasil ditambahkan',
          textConfirm: 'OK',
          onConfirm: () {
            nameC.clear();
            telpC.clear();
            statusC.clear();
            Get.back();
          },
        ));
      }
    } else {
      Get.dialog(CustomDialogSatu(
        title: 'PEMBERITAHUAN',
        content: 'Mohon untuk tidak mengosongkan field',
        textConfirm: 'OK',
        onConfirm: () => Get.back(),
      ));
    }
  }
}
