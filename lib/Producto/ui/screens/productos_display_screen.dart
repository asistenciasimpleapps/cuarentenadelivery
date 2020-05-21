import 'package:cuarentenadelivery/Producto/ui/widgets/productos_display.dart';
import 'package:cuarentenadelivery/Sesion/bloc/sesion_bloc.dart';
import 'package:cuarentenadelivery/widgets/header_app_bar.dart';
import 'package:cuarentenadelivery/widgets/pie_de_pagina.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProductosDisplayScreen extends StatelessWidget {

  SesionBloc sesion;
  String categoria;

  ProductosDisplayScreen({this.categoria});

  @override
  Widget build(BuildContext context) {

    sesion = BlocProvider.of<SesionBloc>(context);
    sesion.changeScreenSize(MediaQuery.of(context).size);

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            height: sesion.screenSize.height,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: 75,),
                  ProductosDisplay(),
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
