
import 'package:flutter_todo_app/db/db_helper.dart';
import 'package:flutter_todo_app/models/task.dart';
import 'package:get/get.dart';

class TaskController extends GetxController{
//obs convert taskList to stream for listening
final RxList<Task> taskList=<Task>[].obs;
  
 Future<int> addTask({Task? task}){
    return DBHelper.insert(task);
  }
  
 Future<void> getTasks() async{
   List<Map<String, dynamic>> tasks=await DBHelper.query();
   taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

 void deleteTasks(Task task) async{
    await DBHelper.delete(task);
    getTasks();
  }

 void markTaskCompleted(int id) async{
    await DBHelper.update(id);
    getTasks();
  }

  @override
  void onReady() {
    super.onReady();
  }
}