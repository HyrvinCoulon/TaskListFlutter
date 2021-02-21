import 'package:flutter/material.dart';


class HomeMain extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
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
          ],
        ),

      );
  }
}

