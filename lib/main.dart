import 'package:flutter/material.dart';
import './screens/tasks_screen.dart';

import 'package:provider/provider.dart';



//models
import 'package:todoey/models/task_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskStore(),
      child: const MyApp(),
    )
    
    
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todoey App',
      home: TaskScreen(),
    
    );
  }
}



class TaskStore extends ChangeNotifier{
  List<Task> allTasks = [];



  late String newTask;
  
  
  //task index used to update the state of the checkbox
  late int index;


  void createTask(task){
    newTask = task;
  }

  void addTask(){
    if(newTask.isNotEmpty){
      allTasks.add(Task(taskName: newTask));
      notifyListeners();
    }
    
  }

  void removeTask(index){
    allTasks.removeAt(index);
    notifyListeners();
  }


  void provideCheckBoxIndex(i){
    index = i;
  }


  void toggleCheckBox(bool? value){
    allTasks[index].isChecked = value;
    notifyListeners();
  }








}