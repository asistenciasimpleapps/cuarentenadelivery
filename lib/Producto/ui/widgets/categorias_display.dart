import 'package:cuarentenadelivery/Categoria/model/categoria.dart';
import 'package:cuarentenadelivery/Sesion/bloc/sesion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class CategoriasDisplay extends StatefulWidget {

  SesionBloc sesion;

  @override
  _CategoriasDisplayState createState() => _CategoriasDisplayState();
}

class _CategoriasDisplayState extends State<CategoriasDisplay> {
  @override
  Widget build(BuildContext context) {

    widget.sesion = BlocProvider.of<SesionBloc>(context);

    return StreamBuilder<Size>(
      stream: widget.sesion.screenSizeStream,
      builder: (context, snapshot) {
        List<Categoria> categorias = [
          Categoria(name: "Lacteos", productos: []),
          Categoria(name: "Abarrotes", productos: []),
          Categoria(name: "Articulos de Aseo", productos: []),
          Categoria(name: "Abarrotes", productos: []),
          Categoria(name: "Lacteos", productos: []),
          Categoria(name: "Abarrotes", productos: []),
          Categoria(name: "Lacteos", productos: []),
        ];

        int row = snapshot.hasData?(snapshot.data.width/500).truncate():1;

        return Container(
            height: 600,
            width: snapshot.hasData?snapshot.data.width:500,
            child: GridView.builder(
                itemCount: 7,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: row),
                itemBuilder: (BuildContext context, int index){
                  return ButtonCategoria(categorias[index]);
                }
            )
        );
      }
    );
  }


  Widget Categorias(List<Categoria> categorias, widthScreen) {

    return Container(
      height: 600,
      width: widthScreen,
      child: GridView.builder(
        itemCount: 7,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: widthScreen/500),
        itemBuilder: (BuildContext context, int index){
          return ButtonCategoria(categorias[index]);
        }
      )
    );
  }

  Widget ButtonCategoria(Categoria categoria){
    return Container(
      height: 400,
      width: null,
      color: Colors.green,
      child: Column(
        children: [
          Text(categoria.name, style: TextStyle(fontSize: 30),),
          FadeInImage(
              placeholder: AssetImage("img/no-image.png"),
              image: NetworkImage("")
          ),
        ],
      ),
    );
  }
}
