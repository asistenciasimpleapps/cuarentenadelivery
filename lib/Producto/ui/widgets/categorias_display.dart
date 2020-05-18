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
          Categoria(name: "Lacteos", productos: [], urlImage: "https://cdn.pixabay.com/photo/2016/12/06/18/27/milk-1887237_640.jpg"),
          Categoria(name: "Abarrotes", productos: [], urlImage: "https://cdn.pixabay.com/photo/2017/10/01/20/17/music-2806852_960_720.jpg"),
          Categoria(name: "Articulos de Aseo", productos: [], urlImage: "https://cdn.pixabay.com/photo/2016/11/19/00/17/broom-1837434_640.jpg"),
        ];

        int row = snapshot.hasData?(snapshot.data.width/500).truncate():1;

        return Container(
            height: snapshot.hasData?snapshot.data.width/row:500,
            width: snapshot.hasData?snapshot.data.width:500,
            child: GridView.builder(
                itemCount: categorias.length,
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

    return GridView.builder(
        itemCount: categorias.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: widthScreen/500),
        itemBuilder: (BuildContext context, int index){
          return ButtonCategoria(categorias[index]);
        }
    );
  }

  Widget ButtonCategoria(Categoria categoria){
    return Stack(
      fit: StackFit.expand,
      children: [
        FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage("img/no-image.png"),
            image: NetworkImage(categoria.urlImage)
        ),
        Container(
          color: Colors.black.withOpacity(0.4),
        ),
        Center(
          child: Text(
            categoria.name.toUpperCase(),
            style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
}
