import 'package:flutter/material.dart';

class ButtonWhite extends StatelessWidget {

  final String title;
  final IconData suffixIcon;

  ButtonWhite({
    Key key,
    @required this.title,
    @required this.suffixIcon
  });

  @override
  Widget build(BuildContext context) {

    Size _screenSize = MediaQuery.of(context).size;

    final logo = Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(suffixIcon, size: _screenSize.height<800?_screenSize.height/35:40,),
          Container(
            width: _screenSize.width<380?_screenSize.width*0.2:null,
            child: Text(title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: _screenSize.height<800?_screenSize.height/45:30,
              ),),
          )
        ],
      ),
    );

    return logo;
  }
}
