import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {

  final title;
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
      padding: EdgeInsets.all(10),
      width: widget.screenSize.width < 260 ? widget.screenSize.width*0.3 : null,
      child: RaisedButton(
        child: widget.title.toString().contains("IconData") ?
          Icon(
            widget.title,
            color: Colors.white,
            size: 18,
          ):
          Text(
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
