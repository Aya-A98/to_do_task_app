

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todotaskapp/addtasks.dart';
import 'package:todotaskapp/viewmodel/viewmodel.dart';

import 'delete.dart';
import 'model/deletemodel.dart';

class sc1 extends StatelessWidget {
  sc1({super.key});
  final name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Consumer(builder: <viewmodel>(context,viewmodel,child){
                  return Row(
                    children: [
                      Expanded(
                          flex: 7,
                          child:
                            Text("Welcome back, ${viewmodel.getusername(name.text)}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(Icons.settings),
                            onPressed: () {},
                          )),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(
                                  builder: (context)=> sc2()));
                            },
                          ))
                    ],
                  );
                }),
              ),
              Expanded(
                  flex: 1,
                  child: Consumer<viewmodel>(builder:(context,viewmodel,child){
                    return Row(children: [
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Total Tasks"),
                                  Text("number is ${viewmodel.getlengthoftask()}")
                                ],
                              ),
                            ),
                          )),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Remeining Tasks"),
                                  Text("number is ${viewmodel.notcompletetasks()}")
                                ],
                              ),
                            ),
                          ))
                    ],);
                  })
              ),
              Expanded(
                  flex: 9,
                  child:
                  Consumer<viewmodel>(builder: (context, viewmodel, child) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(80))),
                      child: ListView.separated(
                          padding: EdgeInsets.all(20),
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: UniqueKey(),
                              onDismissed: (direction) {
                                var title;
                                deletemodel d1 = deletemodel(title.text);
                                viewmodel.deletetask(index , d1 );
                              },
                              background: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    color: Colors.deepOrangeAccent,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: ListTile(
                                  leading: Checkbox(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    side: BorderSide(width: 2),
                                    checkColor: Colors.cyan,
                                    activeColor: Colors.yellow,
                                    value: viewmodel.getvalue(index),
                                    onChanged: (value) {
                                      viewmodel.settaskvalue(index, value!);
                                    },
                                  ),
                                  title: Text(
                                    viewmodel.gettitle(index),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 10);
                          },
                          itemCount: viewmodel.getlengthoftask()),
                    );
                  })),
            ],
          ),
        ),
        floatingActionButton:addtasks()
    );
  }
}




























/*Consumer<viewmodel>(builder: (context, viewmodel, child) {
      return FloatingActionButton(
        onPressed: () {
          //alert();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AlertDialog(
            title: Text("Your Name : "),
            actions: [
              TextField(
                controller: name,
                decoration: InputDecoration(label: Text("Enter Your Name")),
              ),
              TextButton(child:Text("OK"),
                onPressed: () {
                  user use = user (name.text);
                  viewmodel.getusername(use);
                  print(name);
                  name.clear();
                  // viewmodel viewmod = new viewmodel();
                  //viewmod.addproduct(text.text as product);
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
}*/
