import 'package:flutter/material.dart';
import 'package:frentalk_app/global_controllers/auth_controller.dart';
import 'package:frentalk_app/pages/home_page/controllers/home_controller.dart';
import 'package:frentalk_app/routes/name_route.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    final homeC = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('BERANDA'),
        actions: [
          IconButton(
              onPressed: () {
                authC.logout();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: FutureBuilder(
          future: homeC.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var allDocData = snapshot.data!.docs;
              return Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: ListView.builder(
                  itemCount: allDocData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(),
                      title: Text(
                          '${(allDocData[index].data() as Map<String, dynamic>)['name']}'),
                      subtitle: Text(
                          '${(allDocData[index].data() as Map<String, dynamic>)['status']}'),
                      trailing: IconButton(
                          onPressed: () {}, icon: Icon(Icons.delete)),
                    );
                  },
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteNames.addUser);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
