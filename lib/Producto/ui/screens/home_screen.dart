import 'package:cuarentenadelivery/widgets/header_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          HeaderAppBar(true),
//          PromoBar()
        ],
      ),
    );
  }
}
