import 'package:cuarentenadelivery/Sesion/bloc/sesion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ButtonGreen extends StatefulWidget {

  final title;

  ButtonGreen({
    Key key,
    @required this.title,
  });

  @override
  _ButtonGreenState createState() => _ButtonGreenState();
}

class _ButtonGreenState extends State<ButtonGreen> {

  SesionBloc sesion;

  @override
  Widget build(BuildContext context) {

    sesion = BlocProvider.of(context);

    return Container(
      padding: EdgeInsets.all(10),
      width: sesion.screenSize.width < 260 ? sesion.screenSize.width*0.3 : null,
      child: RaisedButton(
        child: widget.title.toString().contains("IconData") ?
          Icon(
            widget.title,
            color: Colors.white,
            size: 18,
          ):
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18
            ),
          ),
        color: Colors.green,
        onPressed: (){

        },
      ),
    );
  }
}
