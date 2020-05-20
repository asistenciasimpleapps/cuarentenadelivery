import 'package:flutter/material.dart';

class ButtonWhite extends StatelessWidget {

  final String title;
  final String subText;
  final IconData suffixIcon;
  VoidCallback onPressed;

  ButtonWhite({
    Key key,
    @required this.title,
    @required this.suffixIcon,
    this.onPressed,
    this.subText = ""
  });

  @override
  Widget build(BuildContext context) {

    Size _screenSize = MediaQuery.of(context).size;

    final logo = Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0,-0.4),
                blurRadius: 10
            )
          ]
      ),
      child: RaisedButton(
        onPressed: onPressed,
        disabledColor: Colors.transparent,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(suffixIcon, size: 40,),
            _screenSize.width<370 ? Container() :Container(
              width: _screenSize.width<640?250-(640-_screenSize.width)/2:250,
              child: Column(
                children: [
                  Text(
                    subText.isEmpty ? title : title+": "+subText,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

    return logo;
  }
}
