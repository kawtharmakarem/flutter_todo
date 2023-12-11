
import 'package:flutter_todo_app/models/task.dart';
import 'package:get/get.dart';

class TaskController extends GetxController{

final taskList=<Task>[
  Task(
    title: 'Title 1',
    note: 'Note Something',
    isCompleted: 0,
    startTime: '8:10',
    endTime: '2:40',
    color: 2
  ),
  Task(
    title: 'Title 2',
    note: 'Note Something',
    isCompleted: 1,
    startTime: '8:10',
    endTime: '2:40',
    color: 1
  ),
  
];

  getTasks(){}

  @override
  void onReady() {
    super.onReady();
  }
}