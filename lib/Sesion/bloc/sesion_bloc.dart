import 'package:cuarentenadelivery/Sesion/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SesionBloc implements Bloc {

  final _auth_repository = AuthRepository();

  Stream<FirebaseUser> _streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => _streamFirebase;
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  Future<FirebaseUser> signIn(String email, String password)
      => _auth_repository.signInFirebase(email, password);

  signOut(){
    _auth_repository.signOutFirebase();
  }

  @override
  void dispose() {

  }

}