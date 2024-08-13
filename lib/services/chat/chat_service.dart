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
  Future<String?> getReceiverID(String email) async {
    try {
      //Query the firestore for user with the specified email
      final snapshot = await _firestore
          .collection('Users')
          .where('email', isEqualTo: email)
          .get();
      //Return the receiver's ID
      if (snapshot.docs.isNotEmpty) {
        final user = snapshot.docs.first.data() as Map<String, dynamic>;
      } else {
        print('Receiver not found');
        return null;
      }
    } catch (e) {
      //Printing the error
      print('error fetching receiver ID : $e');
      return null;
    }
  }

  //Method to send message to the specified receiver

  //Method to get message from a chat room
}
