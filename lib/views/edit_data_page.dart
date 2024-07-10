import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import '../models/user_model.dart';

class EditDataPage extends StatelessWidget {
  final User user;
  final UserController userController = Get.find();
  final TextEditingController nameController;
  final TextEditingController mobileController;
  final TextEditingController ageController;
  final TextEditingController genderController;
  final TextEditingController addressController;

  EditDataPage({required this.user})
      : nameController = TextEditingController(text: user.name),
        mobileController = TextEditingController(text: user.mobile),
        ageController = TextEditingController(text: user.age.toString()),
        genderController = TextEditingController(text: user.gender),
        addressController = TextEditingController(text: user.address);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Data')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: mobileController,
              decoration: InputDecoration(labelText: 'Mobile'),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: genderController,
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                user.name = nameController.text;
                user.mobile = mobileController.text;
                user.age = int.parse(ageController.text);
                user.gender = genderController.text;
                user.address = addressController.text;
                userController.updateUser(user);
                Get.back();
              },
              child: Text('Update Data'),
            ),
          ],
        ),
      ),
    );
  }
}
