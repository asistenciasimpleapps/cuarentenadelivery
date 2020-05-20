import 'package:flutter/material.dart';

class ButtonWhite extends StatelessWidget {

  final String title;
  final String subText;
  final IconData suffixIcon;
  VoidCallback onPressed;

  ButtonWhite({
    Key key,
    @required this.title,
    this.suffixIcon,
    this.onPressed,
    this.subText = ""
  });

  @override
  Widget build(BuildContext context) {

    Size _screenSize = MediaQuery.of(context).size;

    final logo = Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: onPressed!=null ?[
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0,-0.4),
                blurRadius: 10
            )
          ] : []
      ),
      child: RaisedButton(
        onPressed: onPressed,
        disabledColor: Colors.transparent,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            suffixIcon!=null ? Icon(suffixIcon, size: 25,) : Container(),
            _screenSize.width<370 ? Container() :Container(
            width: _screenSize.width<450?170-(450-_screenSize.width)/2:170,
            child: Text(
              subText.isEmpty ? title : title+": "+subText,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return logo;
  }
}
