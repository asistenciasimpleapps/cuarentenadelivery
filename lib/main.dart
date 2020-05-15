import 'package:flutter/material.dart';

import 'Producto/ui/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuarentena Delivery',
//      home: Scaffold(
//        body: Center(
//          child: Text("Hola Mundo"),
//        ),
//      ),
      home: HomeScreen()
    );
  }
}
