import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task/db/db_helper.dart';
import 'dart:convert';

import '../models/task.dart';

class TaskController extends GetxController {
  var taskList = <Task>[].obs;

  @override
  void onReady() {
    super.onReady();
  }

  Future<int> saveTask(Task? task) async {
    return await DBHelper.insert(task);
  }

  void getAllTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((task) => Task.fromJson(task)).toList());
  }

  void delete(Task task) async {
    await DBHelper.delete(task);
    getAllTasks();
  }

  void markTaskCompleted(int id) async {
    await DBHelper.update(id);
    getAllTasks();
  }
}
