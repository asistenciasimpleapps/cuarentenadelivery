import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {

  final String title;
  Size screenSize;

  ButtonGreen({
    Key key,
    @required this.title,
    @required this.screenSize
  });

  @override
  _ButtonGreenState createState() => _ButtonGreenState();
}

class _ButtonGreenState extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenSize.width < 210 ? widget.screenSize.width*0.2 : null,
      child: RaisedButton(
        child: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
        ),
        color: Colors.green,
        onPressed: (){

        },
      ),
    );
  }
}
