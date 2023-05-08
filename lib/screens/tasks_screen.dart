import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_list.dart';
import 'package:todoey/widgets/add_task.dart';




import 'package:todoey/models/task_model.dart';



//provider package
import 'package:provider/provider.dart';

//task store
import 'package:todoey/main.dart' show TaskStore;



class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: const Color(0xFF757575),
            context: context,
            builder: (context) => AddTask()
           );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          size: 25,
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 25),
                const Text('Todoey',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 5),
                Text('${Provider.of<TaskStore>(context).allTasks.length} Tasks', style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
          const Expanded(
            child: TaskList(),
          ),
        ],
      ),
    );
  }
}
