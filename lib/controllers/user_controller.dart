import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/database_service.dart';
import '../services/backup_service.dart';

class UserController extends GetxController {
  var userList = <User>[].obs;
  final DatabaseService _databaseService = DatabaseService();
  final BackupService _backupService = BackupService();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    userList.value = await _databaseService.users();
  }

  Future<void> addUser(User user) async {
    await _databaseService.insertUser(user);
    fetchUsers();
  }

  Future<void> updateUser(User user) async {
    await _databaseService.updateUser(user);
    fetchUsers();
  }

  Future<void> deleteUser(int id) async {
    await _databaseService.deleteUser(id);
    fetchUsers();
  }

  Future<void> deleteAllUsers() async {
    await _databaseService.deleteAllUsers();
    fetchUsers();
  }

  Future<void> backupData() async {
    await _backupService.backupData();
  }

  Future<void> restoreData() async {
    await _backupService.restoreData();
    fetchUsers();
  }
}
