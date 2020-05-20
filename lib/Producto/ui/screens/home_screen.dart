import 'package:cuarentenadelivery/Producto/ui/widgets/categorias_display.dart';
import 'package:cuarentenadelivery/Producto/ui/widgets/pie_de_pagina.dart';
import 'package:cuarentenadelivery/Producto/ui/widgets/promo_bar.dart';
import 'package:cuarentenadelivery/Sesion/bloc/sesion_bloc.dart';
import 'package:cuarentenadelivery/widgets/header_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class HomeScreen extends StatelessWidget {

  Size screenSize;
  SesionBloc sesion;

  @override
  Widget build(BuildContext context) {

    sesion = BlocProvider.of<SesionBloc>(context);
    screenSize = MediaQuery.of(context).size;
    sesion.changeScreenSize(screenSize);

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            height: screenSize.height,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: 75,),
                  PromoBar(),
                  CategoriasDisplay(),
                  PieDePagina(),
                  ],
                ),
              ),
            ),
          Container(height: 65, child: HeaderAppBar(true)),
        ],
      ),
    );
  }

}
