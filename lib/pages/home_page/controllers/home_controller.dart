import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frentalk_app/global_controllers/auth_controller.dart';
import 'package:frentalk_app/utils/dialog_dua.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final authC = Get.find<AuthController>();

  // Future<QuerySnapshot<Object?>> getData() {
  //   CollectionReference users = FirebaseFirestore.instance.collection('Users');
  //   return users.get();
  // }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamUser() {
    String? uId = '';
    final box = GetStorage();
    if (box.read('userId') != null) {
      var data = box.read('userId');
      uId = data;
    }

    final Stream<QuerySnapshot<Map<String, dynamic>>> usersStream =
        FirebaseFirestore.instance
            .collection('Users')
            .where('userId', isEqualTo: uId)
            .snapshots();
    return usersStream;
  }

  void deleteUser(String id) {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    Get.dialog(CustomDialogDua(
        title: 'PEMBERITAHUAN',
        content: 'Yakin ingin menghapus user ini?',
        textConfirm: 'YA',
        onConfirm: () {
          users.doc(id).delete();
          Get.back();
        },
        textCancle: 'Tidak',
        onCancle: () => Get.back()));
  }
}
