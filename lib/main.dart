import 'package:flutter/material.dart';
import 'Task.dart';
import 'HomeMain.dart';

void main() {
  runApp(MyApp());
}

var list = {"lightBlueI":0xFF29B6F6,
  "lightBlueIsh":0xFF40C4FF,
  "greenish":0xFF69F0AE,
  "green":0xFF4CAF50,
  "amber":0xFFFF6F00,
  'redAccent':0xFFD50000,
  "black":0xFF000000,
  "bleuCanard":0xFF316879,
  "coral":0xFFF60A60
};

dynamic ListTask = {};

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new  MaterialApp( // Always make it new for understandement
         title: 'TaskList',

         theme: new ThemeData(scaffoldBackgroundColor: Color(list['bleuCanard'])),
         
         // Main Page
         home: Home(),
      );
  }
}


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<Home>{

  int _currentIndex = 0, globalIndex = 0;
  final List<Widget> _children = [
    HomeMain(),
    Task(list),
    TodoList()
  ];
  double visible = 0;

  void onTabTapped(int index) {
    setState(() {
      globalIndex = _currentIndex = index;
      if(index == 1){
        visible = 1;
      }else{
        visible = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

       appBar: new AppBar(
           title: new Text('Tasked !!!'),
           backgroundColor: Color(list["lightBlueI"])
        ),
        body: _children[globalIndex],

        floatingActionButton: Opacity(
           opacity: visible,
           child:FloatingActionButton(

             onPressed: () {
               setState(() {
                 globalIndex = 2;
                 visible = 0;
               });
             },

             child: Icon(Icons.add),
             backgroundColor: Color(list['coral']),
          )
       ),


        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(list["lightBlueI"]),
            selectedItemColor: Colors.white,
            unselectedItemColor: Color(list["coral"]),
            selectedFontSize: 15,
            unselectedFontSize: 15,
            currentIndex: _currentIndex,
            onTap: onTabTapped,

            items: [
              new BottomNavigationBarItem(
                  icon: new Icon(
                    Icons.home,
                  ),
                  title: new Text('Home')),
              new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.list_alt,
                ),
                title: new Text('TaskList'),
              )
            ]
        ),
      );
  }

}




