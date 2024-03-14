import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frentalk_app/pages/edit_page/controllers/edit_controller.dart';
import 'package:get/get.dart';

class EditUserPage extends StatelessWidget {
  const EditUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final editC = Get.find<EditUserController>();
    final userID = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('EDIT USER'),
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
          future: editC.getData(userID),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var dataUser = snapshot.data!.data() as Map<String, dynamic>;
              print(dataUser['name']);
              editC.nameC.text = dataUser['name'];
              editC.telpC.text = dataUser['telp'];
              editC.statusC.text = dataUser['status'];
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Nama Pengguna')),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            autocorrect: false,
                            autofocus: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            controller: editC.nameC,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text('No. HP')),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            autocorrect: false,
                            autofocus: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            controller: editC.telpC,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Status')),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            autocorrect: false,
                            autofocus: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            controller: editC.statusC,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
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
                            editC.editUser(
                              editC.nameC.text,
                              editC.telpC.text,
                              editC.statusC.text,
                              userID,
                            );
                          },
                          child: Text(
                            'EDIT USER',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              );
            }
            ;
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
