import 'package:flutter/material.dart';

//provider package
import 'package:provider/provider.dart';


//Taskstore
import "package:todoey/main.dart" show TaskStore;

class TaskTile extends StatelessWidget {
  const TaskTile({super.key,required this.taskText,required this.checkBoxState,required this.checkBoxCallBack, required this.index});

  final String taskText;
  final void Function(bool?) checkBoxCallBack;
  final bool? checkBoxState;
  final int index;

 

  @override
  Widget build(BuildContext context) {
    return ListTile(
                onLongPress:()=>Provider.of<TaskStore>(context,listen: false).removeTask(index) ,
                leading: Text(taskText,style: TextStyle(decoration: checkBoxState != null && checkBoxState == true?TextDecoration.lineThrough:null),),
                trailing: Checkbox(
                  activeColor: Colors.lightBlueAccent,
                  value: checkBoxState,
                  onChanged: checkBoxCallBack,
                ),
          );
  }
}


