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
            Icon(suffixIcon, size: _screenSize.height<800?_screenSize.height/35:40,),
            Container(
              width: _screenSize.width<380?_screenSize.width*0.2:null,
              child: Column(
                children: [
                  Text(
                    subText.isEmpty ? title : title+": "+subText,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: _screenSize.height<800?_screenSize.height/45:30,
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
