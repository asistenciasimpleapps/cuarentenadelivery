import 'package:cuarentenadelivery/Categoria/ui/widgets/categorias_display.dart';
import 'package:cuarentenadelivery/Categoria/ui/widgets/promo_bar.dart';
import 'package:cuarentenadelivery/Sesion/bloc/sesion_bloc.dart';
import 'package:cuarentenadelivery/widgets/header_app_bar.dart';
import 'package:cuarentenadelivery/widgets/pie_de_pagina.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class HomeScreen extends StatelessWidget {

  SesionBloc sesion;

  @override
  Widget build(BuildContext context) {

    sesion = BlocProvider.of<SesionBloc>(context);
    sesion.changeScreenSize( MediaQuery.of(context).size);

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
                  PromoBar(),
                  CategoriasDisplay(),
                  PieDePagina(),
                  ],
                ),
              ),
            ),
          Container(height: 65, child: HeaderAppBar(login: true,pop: false)),
        ],
      ),
    );
  }

}
