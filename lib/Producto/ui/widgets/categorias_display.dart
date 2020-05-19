import 'package:cuarentenadelivery/Categoria/model/categoria.dart';
import 'package:cuarentenadelivery/Sesion/bloc/sesion_bloc.dart';
import 'package:cuarentenadelivery/widgets/button_white.dart';
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

        int col = snapshot.hasData?(snapshot.data.width/500).truncate():1;
        col = snapshot.hasData?(snapshot.data.width<500?1:col):col;
        double widthWrap = snapshot.hasData?-100+snapshot.data.width:40;
        double widthCol = widthWrap/col-20;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWhite(
                  title: "Productos por categoria",
                  suffixIcon: Icons.apps,
                ),
                ButtonWhite(
                  title: "Tipo de vista",
                  subText: "Grande",
                  suffixIcon: Icons.view_list,
                  onPressed: (){},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 50,),
                Container(
                  width: widthWrap,
                  child: Wrap(
                    children: [
                      ButtonCategoria(
                        categorias[0],
                        width: widthCol
                      ),
                      ButtonCategoria(
                        categorias[1],
                        width: widthCol
                      ),
                      ButtonCategoria(
                        categorias[2],
                        width: widthCol
                      ),
                    ],
                  ),
                ),
//                Wrap(
//
//                  children: [
//                    ButtonCategoria(categorias[0])
//                  ],
//                ),
                SizedBox(width: 50,),
              ],
            ),
          ],
        );
      }
    );
  }

  Widget ButtonCategoria(Categoria categoria, { double width }){
    return InkWell(
      child: Container(
        width: width,
        height: width,
        margin: EdgeInsets.all(10),
        child: Stack(
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
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
