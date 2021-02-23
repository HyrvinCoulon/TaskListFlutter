import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class TaskState extends StatefulWidget {

  final Map list;
  Map l;


  TaskState(this.list, this.l);

  @override
  createState() => new Task(this.list, this.l);
}

// ignore: must_be_immutable
class Task extends State<TaskState>{

  final Map list;
  Map taskList;

  Task(this.list, this.taskList);

  @override
  Widget build(BuildContext context) {
    return new Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20.0),
          
          child : new Column(
            
            children: [
              new Text('TaskPage !!!',
                style: TextStyle(
                    fontSize: 20,
                    color: Color(list["lightBlueIsh"])
                ),
              ),

              Expanded(child: _buildList()),
            ],
            
          ),
        
        );
  }

  Widget _buildList() {
    return new ListView.separated(
      itemCount: taskList.length,
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      // ignore: missing_return
      itemBuilder: (context, index){
        String  key = taskList.keys.elementAt(index);
        return _buildItem(key);

      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
     );
  }

  // Build a single todo item
  Widget _buildItem(String todoText) {

    return Container(
       height : 50,
       decoration: BoxDecoration(
         color: Color(0xFF7FE7DC),
         border: Border.all(
           color: Colors.white,
         ),
         borderRadius: BorderRadius.all(Radius.circular(20)),
       ),

       child : Center(

            child: new Text(todoText,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ),
            )

       ),
    );
  }


}



// ignore: must_be_immutable
/*class AddTasks extends StatelessWidget{

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

}*/

class TodoList extends StatefulWidget {

  Map l;

  TodoList(this.l);

  @override
  createState() => new TodoListState(l);
}

class TodoListState extends State<TodoList> {

  List<String> _todoItems = [];
  int head = 0;
  TextEditingController inputTask = new TextEditingController(), nameList = new TextEditingController(text: " ");
  Map l;

  TodoListState(Map l){
    this.l = l;
  }


  Widget _buildTodoList() {

    return new ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: 20,
      shrinkWrap: true,
      // ignore: missing_return
      itemBuilder: (context, index){
        if(index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index]);
        }
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  // Build a single todo item
  Widget _buildTodoItem(String todoText) {

    return Container(
      height : 50,
      color: Color(0xFF7FE7DC),
      
      child : Center(

          child: new Text(todoText,
            style: TextStyle(
                fontSize: 20,
                color: Colors.white
            ),
          )

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(

        mainAxisSize: MainAxisSize.max,
        children: <Widget>[

          Text(
              nameList.text
          ),

          Expanded(
            child: _buildTodoList()
          ),

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
                        if(head == 0){
                          nameList.text = inputTask.text;
                          l[nameList.text] = new List<String>();
                          //print(l);
                          head += 1;
                        }else {
                          l[nameList.text].add(inputTask.text);
                          print(l);
                          _todoItems.add(inputTask.text);
                          //print(_todoItems);
                        }
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