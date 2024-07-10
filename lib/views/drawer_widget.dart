import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import 'create_user_page.dart';
import 'edit_user_page.dart';

class DrawerWidget extends StatelessWidget {
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Obx(() => Text(userController.userList.isNotEmpty ? userController.userList.first.name : '')),
            accountEmail: Obx(() => Text(userController.userList.isNotEmpty ? userController.userList.first.mobile : '')),
            currentAccountPicture: Obx(() {
              if (userController.userList.isNotEmpty && userController.userList.first.photo != null) {
                return CircleAvatar(
                  backgroundImage: FileImage(File(userController.userList.first.photo!)),
                );
              } else {
                return CircleAvatar(child: Icon(Icons.person));
              }
            }),
          ),
          ListTile(
            title: Text('Create User'),
            onTap: () {
              Get.to(() => CreateUserPage());
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Get.to(() => EditUserPage());
            },
          ),
          ListTile(
            title: Text('Backup Data'),
            onTap: () async {
              await userController.backupData();
              Get.snackbar('Success', 'Data backup successful');
            },
          ),
          ListTile(
            title: Text('Restore Data'),
            onTap: () async {
              await userController.restoreData();
              Get.snackbar('Success', 'Data restored successfully');
            },
          ),
          ListTile(
            title: Text('Delete All Data'),
            onTap: () {
              userController.deleteAllUsers();
            },
          ),
        ],
      ),
    );
  }
}
