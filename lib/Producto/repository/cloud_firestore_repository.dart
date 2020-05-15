import 'package:cuarentenadelivery/Categoria/model/categoria.dart';
import 'package:cuarentenadelivery/Producto/model/producto.dart';

import 'cloud_firestore_api.dart';

class CloudFirestoreRepository {

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateCategoriaData(Categoria categoria) => _cloudFirestoreAPI.updateCategoriaData(categoria);

  Future<void> updateProductoData(Categoria categoria, Producto producto) => _cloudFirestoreAPI.updateProductoData(categoria, producto);
}