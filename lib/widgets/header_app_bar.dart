import 'package:cuarentenadelivery/widgets/button_white.dart';
import 'package:flutter/material.dart';

import 'button_green.dart';

class HeaderAppBar extends StatelessWidget {

  final bool sesion;
  Size _screenSize;

  HeaderAppBar(this.sesion);

  @override
  Widget build(BuildContext context) {

    _screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0,1),
            spreadRadius: 5
          )
        ]
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: _screenSize.width>1500 ? 150/420*(_screenSize.width-1500) : 0,),
                ButtonWhite(
                  title: "Cuarentena Delivery",
                  suffixIcon: Icons.home,
                ),
              ],
            ),
            Row(
              children: [
                loginButton(sesion),
                SizedBox(width: _screenSize.width>1500 ? 150/420*(_screenSize.width-1500) : 0,),
              ],
            ),
          ],
      ),
    );
  }

  Widget loginButton(bool sesion) {
    return sesion?ButtonGreen(
        screenSize: _screenSize,
        title: _screenSize.width<260?Icons.account_box:"Iniciar Sesion",
      ):Container();
  }
}
