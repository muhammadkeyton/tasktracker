import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';


//models
import 'package:todoey/models/task_model.dart';



//provider package
import 'package:provider/provider.dart';



//task store
import 'package:todoey/main.dart' show TaskStore;

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
  });

 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
      ),
      child: ListView.builder(
        itemBuilder: (context,index){
          return TaskTile(index:index,taskText:Provider.of<TaskStore>(context).allTasks[index].taskName,checkBoxState:Provider.of<TaskStore>(context).allTasks[index].isChecked,checkBoxCallBack: (newValue){
            
           Provider.of<TaskStore>(context,listen: false).provideCheckBoxIndex(index);
           Provider.of<TaskStore>(context,listen:false).toggleCheckBox(newValue);
           
          
          },);
        },
        itemCount:Provider.of<TaskStore>(context).allTasks.length,
        
        
      )
    );
  }
}
