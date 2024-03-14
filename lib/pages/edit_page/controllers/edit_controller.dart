import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frentalk_app/utils/dialog_dua.dart';
import 'package:get/get.dart';
import 'package:frentalk_app/utils/dialog_satu.dart';

class EditUserController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late TextEditingController nameC;
  late TextEditingController telpC;
  late TextEditingController statusC;

  @override
  void onInit() {
    nameC = TextEditingController();
    telpC = TextEditingController();
    statusC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    telpC.dispose();
    statusC.dispose();
    super.onClose();
  }

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    return users.doc(id).get();
  }

  void editUser(String name, String telp, String status, String id) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    if (name.isNotEmpty && telp.isNotEmpty && status.isNotEmpty) {
      try {
        Get.dialog(CustomDialogDua(
            title: 'PEMBERITAHUAN',
            content: 'Apakah anda yakin ingin mengubah data?',
            textConfirm: 'YA',
            onConfirm: () async {
              await users.doc(id).update({
                'name': name,
                'telp': telp,
                'status': status,
              });
              Get.back();
              Get.back();
            },
            textCancle: 'Tidak',
            onCancle: () {
              nameC.clear();
              telpC.clear();
              statusC.clear();
              Get.back();
              Get.back();
            }));
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
