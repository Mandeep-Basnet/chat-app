import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/my_drawer.dart';
import 'package:flutter_application_2/services/auth/auth_service.dart';
import 'package:flutter_application_2/services/chat/chat_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //Services to handle chat-related operations
  final ChatService _chatService = ChatService();

  //Services to handle authentication services
  final AuthService _authService = AuthService();

  void logout() {
    AuthService().signOut();
  }

  @override
  Widget build(BuildContext context) {
    //Get Current user's information
    final currentUser = _authService.getCurrentUser();
    return Scaffold(
        appBar: AppBar(
          title: Text("H O M E"),
          actions: [
            Icon(Icons.person),
            Text('${currentUser?.email}'),
            IconButton(onPressed: logout, icon: Icon(Icons.logout))
          ],
        ),
        drawer: MyDrawer(),
        body: buildUsersList());
  }

  //Build list of Users
  Widget buildUsersList() {
    return StreamBuilder<List<Map<String, dynamic>>>(
        stream: _chatService.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            //display error messages
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            //show loading indicator
            return const Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text("Loading Users..."),
                ],
              ),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final userData = snapshot.data![index];
                return Text(userData['email']);
              },
            );
          } else {
            return Text("No Users found.");
          }
        });
  }
}
