import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  //Instance of FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  // method to get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //Sign Up with email and password
  Future<UserCredential> signUpWithEmailPassword(
      String email, String password) async {
    try {
      //Sign Up with email and password
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      //store user data in database
      await _firestore.collection("Users").doc(userCredential.user!.uid).set({
        "email": email,
        "uid": userCredential.user!.uid,
      });
      return userCredential;
    }
    //catch error
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //Sign Out
  Future<void> signOut() async {
    await _auth.signOut();

    print("User Signed Out");
  }

  //Error Handling
}
