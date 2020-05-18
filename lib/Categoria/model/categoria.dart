import 'package:cuarentenadelivery/Producto/model/producto.dart';

class Categoria {

  String name;
  String urlImage;
  List<Producto> productos;


  Categoria({
    this.name,
    this.productos,
    this.urlImage
  });
}