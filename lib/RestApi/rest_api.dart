import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import '../TodoModel.dart';
import 'package:http/http.dart' as http;

class TodoProvider with ChangeNotifier{
  List<TodoModel> _list = [];

  List<TodoModel> get list {
    return [..._list];
  }

  TodoProvider(){
    this.fetchTasks();
  }

  fetchTasks() async{
    final url = "http://192.168.1.95:8000/api/list/?format=json";
    final response = await http.get(url);

    if(response.statusCode == 200){
      var data = json.decode(response.body) as List;
      _list = data.map<TodoModel>((json) => TodoModel.fromJson(json)).toList();
    }
  }
}