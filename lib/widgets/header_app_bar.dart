import 'package:cuarentenadelivery/Sesion/bloc/sesion_bloc.dart';
import 'package:cuarentenadelivery/widgets/button_white.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'button_green.dart';

class HeaderAppBar extends StatelessWidget {

  final bool login;
  final bool pop;

  HeaderAppBar({this.login, this.pop});

  SesionBloc sesion;

  @override
  Widget build(BuildContext context) {

    sesion = BlocProvider.of(context);

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
                SizedBox(width: sesion.screenSize.width>1500 ? 150/420*(sesion.screenSize.width-1500) : 0,),
                pop?IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white,),
                ):Container(),
                ButtonWhite(
                  title: "Cuarentena Delivery",
                  suffixIcon: Icons.home,
                ),
              ],
            ),
            Row(
              children: [
                login?ButtonGreen(
                  title: sesion.screenSize.width<260?Icons.account_box:"Iniciar Sesion",
                ):Container(),
                SizedBox(width: sesion.screenSize.width>1500 ? 150/420*(sesion.screenSize.width-1500) : 0,),
              ],
            ),
          ],
      ),
    );
  }
}
