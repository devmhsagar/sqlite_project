import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import 'edit_data_page.dart';

class ReadDataPage extends StatelessWidget {
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data')),
      body: Obx(() {
        return ListView.builder(
          itemCount: userController.userList.length,
          itemBuilder: (context, index) {
            final user = userController.userList[index];
            return ListTile(
              title: Text(user.name),
              subtitle: Text('${user.mobile} - ${user.address}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Get.to(() => EditDataPage(user: user));
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
      }),
    );
  }
}
