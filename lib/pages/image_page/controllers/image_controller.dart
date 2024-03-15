import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as frstorage;

class ImageController extends GetxController {
  final storageRef = frstorage.FirebaseStorage.instance.ref();

  Future<void> uploadImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['jpg', 'jpeg', 'png'],
      type: FileType.custom,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      String names = result.files.single.name;
      print('Nama file adalah :${names}');

      try {
        await storageRef.child('$names').putFile(file);
        print('File berhasil diunggah ke Firebase Storage');
        print(file);
      } catch (e) {
        print('Gagal mengupload file ke database: $e');
      }
    } else {
      // User canceled the picker
      print('Gagal mengambil file');
    }
  }
}
