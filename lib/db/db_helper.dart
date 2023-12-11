import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/task.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  static Database? _db;
  static const int _version=1;
  static const String _tableName='tasks';

 static Future<void> initDb() async{
  if(_db!=null){
    debugPrint('not null db');
    return;
  }else{
    try
    {
      String _path=await getDatabasesPath()+'task.db';
      debugPrint('creating a new one');
     _db = await openDatabase(_path, version: _version,
    onCreate: (Database db, int version) async {
  
  await db.execute(
      'CREATE TABLE $_tableName ('
      'id INTEGER PRIMARY KEY AUTOINCREMENT, title STRING, '
      'note TEXT, date STRING, startTime STRING, endTime STRING, '
      'remind INTEGER, repeat STRING, color INTEGER, isCompleted INTEGER )');
});
    }
    catch(e){
      print('Error: $e');
    }
  }

  }

static Future<int> insert(Task? task) async{
  try{
    print('Inset function here');
    return await _db!.insert(_tableName, task!.json());


  }catch(e){
    print('we are here');
    return 90000;
  }
}

static Future<int> delete(Task task) async{
  return await _db!.delete(_tableName,where: 'id = ?',whereArgs: [task.id]);
}

static Future<int> update(int id) async{
  return await _db!.rawUpdate('''
  UPDATE tasks 
  SET isCompleted = ?
  WHERE id = ?
  ''',[1,id]);
}

static Future<List<Map<String, dynamic>>> query() async{
  return await _db!.query(_tableName);
}
}