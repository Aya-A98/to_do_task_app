
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todotaskapp/viewmodel/viewmodel.dart';
import 'model/task.dart';

class addtasks extends StatelessWidget {
   addtasks({super.key});
   final texts = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<viewmodel>(builder: (context, viewmodel, child) {
      return FloatingActionButton(
        onPressed: () {
          //alert();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AlertDialog(
                title: Text("add task"),
                actions: [
              TextField(
                controller: texts,
                decoration: InputDecoration(label: Text("what you want to do")),
              ),
              TextButton(child:Text("OK"),
                onPressed: () {
                  task t2 = task(texts.text, false);
                  viewmodel.setaddtask(t2);
                  print(texts);
                  texts.clear();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),));
        },
        child: Icon(Icons.add),
      );
    });
  }
}


