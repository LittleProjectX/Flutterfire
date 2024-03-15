import 'package:flutter/material.dart';
import 'package:frentalk_app/pages/image_page/controllers/image_controller.dart';
import 'package:get/get.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final imageC = Get.find<ImageController>();

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('PICK IMAGE'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 160,
              width: 160,
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/image.jpg'),
                  child: ClipOval(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    imageC.uploadImage();
                  },
                  child: Text('UPLOAD')),
            )
          ],
        ),
      ),
    );
  }
}
