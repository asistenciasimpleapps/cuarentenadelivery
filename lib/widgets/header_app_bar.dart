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

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonWhite(
            title: "Cuarentena Delivery",
            suffixIcon: Icons.home,
          ),
          loginButton(sesion)
        ],
    );
  }

  Widget loginButton(bool sesion) {
    return sesion?ButtonGreen(
        screenSize: _screenSize,
        title: _screenSize.width<260?Icons.account_box:"Iniciar Sesion",
      ):Container();
  }
}
