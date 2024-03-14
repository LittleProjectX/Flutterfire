import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frentalk_app/utils/dialog_dua.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Future<QuerySnapshot<Object?>> getData() {
  //   CollectionReference users = FirebaseFirestore.instance.collection('Users');
  //   return users.get();
  // }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamUser() {
    final Stream<QuerySnapshot<Map<String, dynamic>>> usersStream =
        FirebaseFirestore.instance
            .collection('Users')
            .orderBy('date')
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
