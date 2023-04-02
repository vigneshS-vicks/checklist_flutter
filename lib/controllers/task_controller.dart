import 'package:check_list/db/db_helper.dart';
import 'package:check_list/models/task.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  var taskList = <Task>[].obs;

  //read data from db
  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  //delete data
  void delete(Task task) async {
    await DBHelper.delete(task);
    getTasks();
  }

  //udpate task completed
  void markTaskCompleted(int id) async {
    await DBHelper.udpate(id);
    getTasks();
  }
}
