import 'package:flutter/material.dart';
import '../model/deletemodel.dart';
import '../model/task.dart';
import '../model/user.dart';

class viewmodel extends ChangeNotifier{
  user User = user ("Ahmed");
  List<task> Task = <task>[];
  List<deletemodel> Delete = <deletemodel>[];

  String getusername(){
    return User.username;
  }

  void setusername (String u){
    User.username = u  ;
    notifyListeners();
  }

//int get getlengthoftask=>Task.length;
  int getlengthoftask (){
    return Task.length;
  }

  void settaskvalue(int taskindex , bool taskvalue){
    Task[taskindex].complete= taskvalue;
    notifyListeners();
  }

  void setaddtask(task t){
    Task.add(t);
    notifyListeners();
  }

  void deletetask(int index , deletemodel d){
    Delete.add(d);
    Task.removeAt(index);
    notifyListeners();
  }

  String gettitle(int index){
    return Task[index].title;
  }

  bool getvalue (int index){
    return Task[index].complete;
  }

  //int get notcompletetasks => Task.where((task) => !task.complete).length;
  int notcompletetasks(){
    return Task.where((task) => !task.complete).length;
  }

  void deletedeledted(int index ){
    Delete.removeAt(index);
    notifyListeners();
  }

  String getdeleted(int index){
    return Delete[index].deleted;
  }

  int getlengthofdeletetask (){
    return Delete.length;
  }
}