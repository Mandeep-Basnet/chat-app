import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  //Creating Instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Method to get stream of user from firestore
  Stream<List<Map<String, dynamic>>> getUsers() {
    return _firestore.collection('Users').snapshots().map((snapshot) {
      //Convert firestore documents to list of maps
      return snapshot.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }

  //Method to get the receiver's ID based on their email

  //Method to send message to the specified receiver

  //Method to get message from a chat room
}
