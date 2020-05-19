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
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonWhite(
            title: "Cuarentena Delivery",
            suffixIcon: Icons.home,
          ),
          loginButton(sesion)
        ],
      ),
    );
  }

  Widget loginButton(bool sesion) {
    return sesion?Container(
      child: ButtonGreen(
        screenSize: _screenSize,
        title: _screenSize.width<210?"IS":"Iniciar Sesion",
      ),
    ):Container();
  }
}
