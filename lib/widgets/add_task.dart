import 'package:flutter/material.dart';



//provider package
import 'package:provider/provider.dart';


//task store
import 'package:todoey/main.dart' show TaskStore;

class AddTask extends StatelessWidget {

  const AddTask({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
              const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlueAccent),
              ),
              Padding(
                padding: const EdgeInsets.only(top:15,bottom: 15),
                child: TextField(
                  onChanged:(value) => Provider.of<TaskStore>(context,listen:false).createTask(value),
                  textAlign: TextAlign.center,
                  autofocus: true,
                  cursorColor: Colors.lightBlueAccent,
                  decoration: const InputDecoration(
                  
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                      color: Colors.lightBlueAccent
                    )
                  ),

                  
                  
                )),
              ),
            
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent
                ),
                onPressed: () {
                  Provider.of<TaskStore>(context,listen: false).addTask();
                  Navigator.pop(context);
                },
          
                child: const Text('Add'),
                
              ),
            ]),
          )),
    );
  }
}
