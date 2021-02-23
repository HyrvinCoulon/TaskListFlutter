import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_test/RestApi/rest_api.dart';
import 'package:second_test/TodoModel.dart';
import 'package:second_test/main.dart';


class HomeMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeMain();
  }
}

class _HomeMain extends State<HomeMain>{


  static TodoProvider todoL;
  //static List<TodoModel> todoList;

  /*@override
  void initState() {
    todoL = Provider.of<TodoProvider>(context);
    todoList = todoL.list;
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    todoL = Provider.of<TodoProvider>(context);
    //print(todoL);
    return new Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20.0),

        child : new Column(

          children: [
            new Text('No TaskList For now !!!',
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF40C4FF)
              ),
            ),
            Expanded(

                child: new ListView.builder(

                  itemCount: todoL.list.length,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                       title: new Text(todoL.list[index].title),
                       subtitle: new Text("${todoL.list[index].id}"),
                    );
                }
            ))
          ],

        ),

      );
  }
}

