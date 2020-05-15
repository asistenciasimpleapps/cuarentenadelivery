import 'package:flutter/material.dart';

import 'button_green.dart';

class HeaderAppBar extends StatelessWidget {

  final bool sesion;

  HeaderAppBar(this.sesion);

  @override
  Widget build(BuildContext context) {

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
        children: [
          Icon(Icons.home, size: 40,),
          Text("Cuarentena Delivery",
          style: TextStyle(
            fontSize: 30
          ),)
        ],
      ),
    );

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          logo,
          loginButton(sesion)
        ],
      ),
    );
  }

  Widget loginButton(bool sesion) {
    return sesion?ButtonGreen(
      title: "Iniciar Sesion",
    ):Container();
  }
}
