import 'package:flutter/material.dart';
import 'package:frentalk_app/pages/add_page/controllers/add_controller.dart';
import 'package:get/get.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addC = Get.find<AddUserController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD USER'),
      ),
      body: SafeArea(
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
                    controller: addC.nameC,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Align(alignment: Alignment.centerLeft, child: Text('No. HP')),
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
                    controller: addC.telpC,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Align(alignment: Alignment.centerLeft, child: Text('Status')),
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
                    controller: addC.statusC,
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
                    addC.addUser(
                      addC.nameC.text,
                      addC.telpC.text,
                      addC.statusC.text,
                    );
                  },
                  child: Text(
                    'ADD USER',
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
      ),
    );
  }
}
