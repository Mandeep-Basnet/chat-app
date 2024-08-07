import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //Instance of FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign in with email and password
  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    try {
      //Sign In with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
      // if (e.code == 'user-not-found') {
      //   print('No user found for that email.');
      // }
    }
  }

  //Sign Up with email and password

  //Sign Out

  //Error Handling
}
