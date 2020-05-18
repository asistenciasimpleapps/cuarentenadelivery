import 'package:cuarentenadelivery/Sesion/bloc/sesion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'Producto/ui/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: SesionBloc(),
      child: MaterialApp(
        title: 'Cuarentena Delivery',
        theme: ThemeData(
          fontFamily: 'BigNoodLetitling'
        ),
//      home: Scaffold(
//        body: Center(
//          child: Text("Hola Mundo"),
//        ),
//      ),
        home: HomeScreen()
      ),
    );
  }
}
