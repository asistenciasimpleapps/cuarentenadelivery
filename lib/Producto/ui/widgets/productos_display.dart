import 'package:cuarentenadelivery/Producto/model/producto.dart';
import 'package:cuarentenadelivery/Sesion/bloc/sesion_bloc.dart';
import 'package:cuarentenadelivery/widgets/button_white.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProductosDisplay extends StatefulWidget {

  String categoria;

  ProductosDisplay({@required this.categoria});

  @override
  _ProductosDisplayState createState() => _ProductosDisplayState();
}

class _ProductosDisplayState extends State<ProductosDisplay> {

  SesionBloc sesion;

  @override
  Widget build(BuildContext context) {
    sesion = BlocProvider.of(context);

    List<Producto> productos = [
      Producto(name: "Leche",
          description: "Colun Semi-descremada",
          categoria: "Lacteos",
          disponible: 5,
          urlImage: "https://cdn.pixabay.com/photo/2016/12/06/18/27/milk-1887237_640.jpg"),
      Producto(name: "Queso",
          description: "Quiyalles",
          categoria: "Lacteos",
          disponible: 5,
          urlImage: "https://cdn.pixabay.com/photo/2017/10/01/20/17/music-2806852_960_720.jpg"),
      Producto(name: "Tallarines",
          description: "Colun Semi-descremada",
          categoria: "Abarrotes",
          disponible: 5,
          urlImage: "https://cdn.pixabay.com/photo/2016/12/06/18/27/milk-1887237_640.jpg"),
      Producto(name: "Arroz",
          description: "Quiyalles",
          categoria: "Abarrotes",
          disponible: 5,
          urlImage: "https://cdn.pixabay.com/photo/2017/10/01/20/17/music-2806852_960_720.jpg"),
      Producto(name: "Coca Cola",
          description: "Colun Semi-descremada",
          categoria: "Bebidas",
          disponible: 5,
          urlImage: "https://cdn.pixabay.com/photo/2016/12/06/18/27/milk-1887237_640.jpg"),
      Producto(name: "Fanta",
          description: "Quiyalles",
          categoria: "Bebidas",
          disponible: 5,
          urlImage: "https://cdn.pixabay.com/photo/2017/10/01/20/17/music-2806852_960_720.jpg"),
      Producto(name: "Atun",
          description: "Colun Semi-descremada",
          categoria: "Conserva",
          disponible: 5,
          urlImage: "https://cdn.pixabay.com/photo/2016/12/06/18/27/milk-1887237_640.jpg"),
      Producto(name: "Durazno en conserva",
          description: "Quiyalles",
          categoria: "Conserva",
          disponible: 5,
          urlImage: "https://cdn.pixabay.com/photo/2017/10/01/20/17/music-2806852_960_720.jpg"),
      Producto(name: "Trapero",
          description: "Colun Semi-descremada",
          categoria: "Articulos de aseo",
          disponible: 5,
          urlImage: "https://cdn.pixabay.com/photo/2016/12/06/18/27/milk-1887237_640.jpg"),
      Producto(name: "Mascarilla",
          description: "Quiyalles",
          categoria: "Articulos de aseo",
          disponible: 5,
          urlImage: "https://cdn.pixabay.com/photo/2017/10/01/20/17/music-2806852_960_720.jpg"),
      Producto(name: "Pañuelos desechables",
          description: "Colun Semi-descremada",
          categoria: "Articulos de aseo",
          disponible: 5,
          urlImage: "https://cdn.pixabay.com/photo/2016/12/06/18/27/milk-1887237_640.jpg"),
      Producto(name: "Soya",
          description: "Soya",
          categoria: "Abarrotes",
          disponible: 5,
          urlImage: "https://cdn.pixabay.com/photo/2017/10/01/20/17/music-2806852_960_720.jpg"),
    ];

    List<Widget> buttonProductos = new List<Widget>();
    productos.forEach((element) {
      if(element.categoria == widget.categoria){
        buttonProductos.add(
          ButtonProducto(
            element,
            width: sesion.vista != null
                ? sesion.vista['size']
                : 110
          )
        );
      }
    });

    return MostrarCategorias(buttonProductos: buttonProductos);
  }

  Widget MostrarCategorias({List<Widget> buttonProductos}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonWhite(title: "Productos"),
            ButtonWhite(
              title: "Tipo de Vista",
              subText: sesion.vista != null ? sesion.vista['name'] : "PEQUEÑA",
              suffixIcon: sesion.vista != null ? sesion.vista['icon'] : Icons
                  .apps,
              onPressed: () {
                switch (sesion.vista != null
                    ? sesion.vista['name']
                    : "PEQUEÑA") {
                  case 'GRANDE':
                    sesion.changeVista({
                      'name': 'PEQUEÑA',
                      'size': 180,
                      'icon': Icons.apps
                    });
                    break;
                  case 'PEQUEÑA':
                    sesion.changeVista({
                      'name': 'GRANDE',
                      'size': 500,
                      'icon': Icons.crop_square
                    });
                    break;
                }
                setState(() {});
              },
            )
          ],
        ),
        Wrap(
          children: buttonProductos,
        ),
      ],
    );
  }

  Widget ButtonProducto(Producto producto, {double width}) {
    return InkWell(
      onTap: () {
//        Navigator.push(context, MaterialPageRoute(
//          builder: (BuildContext context) => ProductoScreen(),
//        ));
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
                image: NetworkImage(producto.urlImage)
            ),
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
            Center(
              child: Text(
                producto.name.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: width < 300 ? 35 : 70,
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
