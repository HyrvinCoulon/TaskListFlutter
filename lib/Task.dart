import 'package:flutter/material.dart';


class Task extends StatelessWidget{

  final Map list;

  Task(this.list);

  @override
  Widget build(BuildContext context) {
    return new Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20.0),
          
          child : new Column(
            
            children: [
              new Text('TaskPage !!!',
                style: TextStyle(
                    fontSize: 17,
                    color: Color(list["lightBlueIsh"])
                ),
              ),
            ],
            
          ),
        
        );
  }
}



// ignore: must_be_immutable
class AddTasks extends StatelessWidget{

  List<String> _todoItems = [];

  TextEditingController inputTask = new TextEditingController(), nameList;

  /*void _addTodoItem() {
      _todoItems.add('Item ' + index.toString());
  }*/


  Widget _buildTodoList() {
    return new ListView.builder(

      itemCount: 20,
      shrinkWrap: true,
      // ignore: missing_return
      itemBuilder: (context, index){
        if(index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index]);
        }
      },

    );
  }

  // Build a single todo item
  Widget _buildTodoItem(String todoText) {

    return new ListTile(
        title: new Text(todoText)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(

          child: Column(

            mainAxisSize: MainAxisSize.max,
             children: <Widget>[

               Text(
                   'Bonjour'
               ),

               _buildTodoList(),

               new Row(

                 mainAxisSize: MainAxisSize.min,
                 children: [

                     Container(
                         width: 250.0,
                         //alignment: FractionalOffset(0.5, 0.6),
                         child :Align(
                            alignment: Alignment.bottomLeft,

                            child: TextField(
                               textAlign: TextAlign.center,
                               controller: inputTask,
                               style: TextStyle(
                                   height: 1.5,
                                   color: Color(0xFF29B6F6),
                                   fontWeight: FontWeight.w300),
                               decoration: InputDecoration(
                                   hintStyle: TextStyle(
                                       height: 1.5,
                                       color: Color(0xFF29B6F6),
                                       fontWeight: FontWeight.w300
                                   ),
                                   fillColor: Color(0xFF29B6F6),
                                   hintText: 'Enter a your task'
                               ),
                         ),
                       ),
                     ),

                     Container(
                         width: 100.0,
                         height: 65.0,

                         child: Align(
                            alignment: Alignment.bottomRight,
                            child: OutlineButton(
                              onPressed: () {
                                  _todoItems.add(inputTask.text);
                                  print(_todoItems);
                              },
                              child: Text('Click Me'),
                              borderSide: BorderSide(color: Colors.blue),
                              shape: StadiumBorder(),
                              textColor: Color(0xFF29B6F6),
                            ),
                         ),
                     )

                 ],

               ),

            ],

         ),



    );
  }

}

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List<String> _todoItems = [];

  TextEditingController inputTask = new TextEditingController(), nameList;

  /*void _addTodoItem() {
      _todoItems.add('Item ' + index.toString());
  }*/


  Widget _buildTodoList() {
    return new ListView.builder(

      itemCount: 20,
      shrinkWrap: true,
      // ignore: missing_return
      itemBuilder: (context, index){
        if(index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index]);
        }
      },

    );
  }

  // Build a single todo item
  Widget _buildTodoItem(String todoText) {

    return new ListTile(
        title: new Text(todoText)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(

        mainAxisSize: MainAxisSize.max,
        children: <Widget>[

          Text(
              'Bonjour'
          ),

          _buildTodoList(),

          new Row(

            mainAxisSize: MainAxisSize.min,
            children: [

              Container(
                width: 250.0,
                //alignment: FractionalOffset(0.5, 0.6),
                child :Align(
                  alignment: Alignment.bottomLeft,

                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: inputTask,
                    style: TextStyle(
                        height: 1.5,
                        color: Color(0xFF29B6F6),
                        fontWeight: FontWeight.w300),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            height: 1.5,
                            color: Color(0xFF29B6F6),
                            fontWeight: FontWeight.w300
                        ),
                        fillColor: Color(0xFF29B6F6),
                        hintText: 'Enter a your task'
                    ),
                  ),
                ),
              ),

              Container(
                width: 100.0,
                height: 65.0,

                child: Align(
                  alignment: Alignment.bottomRight,
                  child: OutlineButton(
                    onPressed: () {
                      setState(() {
                        _todoItems.add(inputTask.text);
                        print(_todoItems);
                      });

                    },
                    child: Text('Click Me'),
                    borderSide: BorderSide(color: Colors.blue),
                    shape: StadiumBorder(),
                    textColor: Color(0xFF29B6F6),
                  ),
                ),
              )

            ],

          ),

        ],

      ),



    );
  }
}