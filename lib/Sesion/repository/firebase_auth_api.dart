import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthAPI {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> signIn( String email, String password ) async {

    FirebaseUser user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((AuthResult auth) => signIn(email, password));

    return user;
  }

  signOut() async {
    await _auth.signOut();
  }

}