import 'dart:async';

import 'package:cuarentenadelivery/Sesion/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class SesionBloc implements Bloc {

  final _auth_repository = AuthRepository();

  final _screenSizeController = BehaviorSubject<Size>();

//  Stream<FirebaseUser> _streamFirebase  =   FirebaseAuth.instance.onAuthStateChanged;
//  Stream<FirebaseUser> get authStatus   =>  _streamFirebase;
//  Future<FirebaseUser> get currentUser  =>  FirebaseAuth.instance.currentUser();
  Stream<Size> get screenSizeStream     =>  _screenSizeController.stream;

  Function(Size) get changeScreenSize   =>  _screenSizeController.sink.add;

  Size get screenSize    => _screenSizeController.value;

//  Future<FirebaseUser> signIn(String email, String password)
//      => _auth_repository.signInFirebase(email, password);
//
//  signOut(){
//    _auth_repository.signOutFirebase();
//  }

  @override
  void dispose() {
    _screenSizeController?.close();  }

}