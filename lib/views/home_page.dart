import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import 'create_data_page.dart';
import 'drawer_widget.dart';

class HomePage extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User App')),
      drawer: DrawerWidget(),
      body: Obx(() {
        if (userController.userList.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          return ListView.builder(
            itemCount: userController.userList.length,
            itemBuilder: (context, index) {
              final user = userController.userList[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.mobile),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Navigate to edit data page
                        Get.to(() => CreateDataPage(user: user));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        userController.deleteUser(user.id!);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreateDataPage(user: null,));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
