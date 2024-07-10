import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/user_model.dart';
import 'database_service.dart';

class BackupService {
  final DatabaseService _databaseService = DatabaseService();

  Future<void> backupData() async {
    final List<User> users = await _databaseService.users();
    final String data = jsonEncode(users.map((user) => user.toMap()).toList());
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/backup.json');
    await file.writeAsString(data);
  }

  Future<void> restoreData() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/backup.json');
    if (await file.exists()) {
      final String data = await file.readAsString();
      final List<dynamic> userData = jsonDecode(data);
      for (var userMap in userData) {
        User user = User.fromMap(userMap);
        await _databaseService.insertUser(user);
      }
    }
  }
}
