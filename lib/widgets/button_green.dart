import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {

  final String title;

  ButtonGreen({
    Key key,
    @required this.title
  });

  @override
  _ButtonGreenState createState() => _ButtonGreenState();
}

class _ButtonGreenState extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        child: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white
          ),
        ),
        color: Colors.green,
        onPressed: (){

        },
      ),
    );
  }
}
