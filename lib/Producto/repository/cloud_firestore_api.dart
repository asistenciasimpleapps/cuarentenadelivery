/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuarentenadelivery/Categoria/model/categoria.dart';
import 'package:cuarentenadelivery/Producto/model/producto.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFirestoreAPI {

  final String PRODUCTOS = "productos";
  final String CATEGORIAS = "categorias";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
*//*
  Future<void> updateCategoriaData(Categoria categoria) async {
    DocumentReference refCategorias = _db.collection(CATEGORIAS).document(categoria.name);

    await refCategorias.setData({
      'name':             categoria.name,
      'productos':        categoria.productos,
    });
  }

  Future<void> updateProductoData(Categoria categoria, Producto producto) async{
    CollectionReference refProductos = _db.collection(PRODUCTOS);

    await _auth.currentUser().then((FirebaseUser user) {
      refProductos.add({
        'name': producto.name,
        'description': producto.description,
        'urlImage': producto.urlImage,
        'categoria': _db.document("${CATEGORIAS}/${categoria.name}"), //referencia a la categoria
        'disponible': producto.disponible
      }).then((DocumentReference dr) {
        dr.get().then((DocumentSnapshot snapshot) {
          DocumentReference refCategorias = _db.collection(CATEGORIAS).document(producto.categoria);
          refCategorias.updateData({
            'productos'  : FieldValue.arrayUnion([_db.document("${PRODUCTOS}/${snapshot.documentID}")])
          });
        });
      });
    });
  }
}*/