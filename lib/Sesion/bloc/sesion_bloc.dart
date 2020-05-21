import 'dart:async';

import 'package:cuarentenadelivery/Sesion/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class SesionBloc implements Bloc {

  final _auth_repository = AuthRepository();

  final _screenSizeController = BehaviorSubject<Size>();
  final _filtrarCategoriaController = BehaviorSubject<bool>();
  final _vistaController = BehaviorSubject<Map<String,dynamic>>();

//  Stream<FirebaseUser> _streamFirebase  =   FirebaseAuth.instance.onAuthStateChanged;
//  Stream<FirebaseUser> get authStatus   =>  _streamFirebase;
//  Future<FirebaseUser> get currentUser  =>  FirebaseAuth.instance.currentUser();
  Stream<Size> get screenSizeStream => _screenSizeController.stream;
  Stream<bool> get filtrarCategoriaStream => _filtrarCategoriaController.stream;
  Stream<Map<String,dynamic>> get vistaStream     =>  _vistaController.stream;

  Function(Size) get changeScreenSize   =>  _screenSizeController.sink.add;
  Function(bool) get changeFiltrarCategoria   =>  _filtrarCategoriaController.sink.add;
  Function(Map<String,dynamic>) get changeVista   =>  _vistaController.sink.add;


  Size get screenSize    => _screenSizeController.value;
  bool get filtrarCategoria    => _filtrarCategoriaController.value;
  Map<String,dynamic> get vista    => _vistaController.value;

//  Future<FirebaseUser> signIn(String email, String password)
//      => _auth_repository.signInFirebase(email, password);
//
//  signOut(){
//    _auth_repository.signOutFirebase();
//  }

  @override
  void dispose() {
    _screenSizeController?.close();
    _filtrarCategoriaController?.close();
    _vistaController?.close();
  }

}