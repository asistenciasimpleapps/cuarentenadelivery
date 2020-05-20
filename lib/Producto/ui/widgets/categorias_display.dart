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

    widget.sesion.changeVista(widget.sesion.vista == null ? {
      'name'  : 'GRANDE',
      'size'  : 500,
      'icon'  : Icons.apps
    } : widget.sesion.vista);

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

        List<Widget> buttonCategorias = new List<Widget>();
        categorias.forEach((element) {
          buttonCategorias.add(
            ButtonCategoria(
                element,
                width: widget.sesion.vista != null ? widget.sesion.vista['size'] : 200
            )
          );
        });

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWhite(title: "Categorias"),
                ButtonWhite(
                  title: "Tipo de Vista",
                  subText: widget.sesion.vista != null ? widget.sesion.vista['name'] : "GRANDE",
                  suffixIcon: widget.sesion.vista != null ? widget.sesion.vista['icon'] : Icons.apps,
                  onPressed: (){
                    switch(widget.sesion.vista != null ? widget.sesion.vista['name'] : "PEQUEÑA"){
                      case 'GRANDE':
                        widget.sesion.changeVista({
                          'name'  : 'PEQUEÑA',
                          'size'  : 180,
                          'icon'  : Icons.apps
                        });
                        break;
                      case 'PEQUEÑA':
                        widget.sesion.changeVista({
                          'name'  : 'GRANDE',
                          'size'  : 500,
                          'icon'  : Icons.crop_square
                        });
                        break;
                    }
                    setState(() {});
                  },
                )
              ],
            ),
            Wrap(
              children: buttonCategorias,
            ),
          ],
        );
  }

  Widget ButtonCategoria(Categoria categoria, { double width }){
    return InkWell(
      onTap: (){

      },
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
