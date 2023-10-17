import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todotaskapp/viewmodel/viewmodel.dart';

class sc2 extends StatelessWidget {
  const sc2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(title: Text("Deleted Tasks"),),
    body: Column(children: [
    Consumer<viewmodel>(builder: (context, viewmodel, child) {
    return ListView.separated(
        padding: EdgeInsets.all(20),
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              viewmodel.deletedeledted(index);
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
                title: Text(
                  viewmodel.getdeleted(index),
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
        itemCount: viewmodel.getlengthofdeletetask());
    })
    ],),
    );
  }
}
