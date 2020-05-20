import 'package:cuarentenadelivery/Categoria/model/categoria.dart';
import 'package:cuarentenadelivery/Sesion/bloc/sesion_bloc.dart';
import 'package:cuarentenadelivery/widgets/button_white.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class CategoriasDisplay extends StatefulWidget {

  SesionBloc sesion;
  Map<String,dynamic> tipoVista = new Map<String,dynamic>();

  @override
  _CategoriasDisplayState createState() => _CategoriasDisplayState();
}

class _CategoriasDisplayState extends State<CategoriasDisplay> {

  @override
  Widget build(BuildContext context) {

    widget.sesion = BlocProvider.of<SesionBloc>(context);
    Size _screenSize = MediaQuery.of(context).size;

    widget.tipoVista = widget.tipoVista.isEmpty ? {
      'name'  : 'GRANDE',
      'size'  : 500
    } : widget.tipoVista;

    return StreamBuilder<Size>(
      stream: widget.sesion.screenSizeStream,
      builder: (context, snapshot) {
        List<Categoria> categorias = [
          Categoria(name: "Lacteos", productos: [], urlImage: "https://cdn.pixabay.com/photo/2016/12/06/18/27/milk-1887237_640.jpg"),
          Categoria(name: "Abarrotes", productos: [], urlImage: "https://cdn.pixabay.com/photo/2017/10/01/20/17/music-2806852_960_720.jpg"),
          Categoria(name: "Articulos de Aseo", productos: [], urlImage: "https://cdn.pixabay.com/photo/2016/11/19/00/17/broom-1837434_640.jpg"),
          Categoria(name: "Lacteos", productos: [], urlImage: "https://cdn.pixabay.com/photo/2016/12/06/18/27/milk-1887237_640.jpg"),
          Categoria(name: "Abarrotes", productos: [], urlImage: "https://cdn.pixabay.com/photo/2017/10/01/20/17/music-2806852_960_720.jpg"),
          Categoria(name: "Articulos de Aseo", productos: [], urlImage: "https://cdn.pixabay.com/photo/2016/11/19/00/17/broom-1837434_640.jpg"),
          Categoria(name: "Lacteos", productos: [], urlImage: "https://cdn.pixabay.com/photo/2016/12/06/18/27/milk-1887237_640.jpg"),
          Categoria(name: "Abarrotes", productos: [], urlImage: "https://cdn.pixabay.com/photo/2017/10/01/20/17/music-2806852_960_720.jpg"),
          Categoria(name: "Articulos de Aseo", productos: [], urlImage: "https://cdn.pixabay.com/photo/2016/11/19/00/17/broom-1837434_640.jpg"),
        ];

        int col = snapshot.hasData?(snapshot.data.width/widget.tipoVista['size']).round():1;
        col = snapshot.hasData?(snapshot.data.width<widget.tipoVista['size']?1:col):col;
        double widthWrap = snapshot.hasData?-100+snapshot.data.width:40;
        double widthCol = widthWrap/col-20;

        List<Widget> buttonCategorias = new List<Widget>();
        categorias.forEach((element) {
          buttonCategorias.add(
            ButtonCategoria(
                element,
                width: widthCol
            )
          );
        });

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: _screenSize.width>1500 ? 150/420*(_screenSize.width-1500) : 0,),
                    ButtonWhite(
                      title: "Productos por categoria",
                    ),
                  ],
                ),
                Row(
                  children: [
                    ButtonWhite(
                      title: "Tipo de vista",
                      subText: widget.tipoVista['name'],
                      suffixIcon: Icons.view_list,
                      onPressed: (){
                        setState(() {
                          widget.tipoVista = widget.tipoVista['name']=='GRANDE' ? {
                            'name'  : 'PEQUENA',
                            'size'  : 200
                          } : {
                            'name'  : 'GRANDE',
                            'size'  : 500
                          };
                        });
                      },
                    ),
                    SizedBox(width: _screenSize.width>1500 ? 150/420*(_screenSize.width-1500) : 0),
                  ],
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
                    children: buttonCategorias
                  ),
                ),
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
        decoration: BoxDecoration(
            color: Colors.blue,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 5
              )
            ]
        ),
        width: width,
        height: width,
        margin: EdgeInsets.all(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(
                fit: BoxFit.cover,
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
                    fontSize: width<300 ? 35 : 70,
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
