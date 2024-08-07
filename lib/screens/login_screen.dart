import 'package:flutter/material.dart';
import 'package:flutter_application_2/auth/authService.dart';
import 'package:flutter_application_2/components/my_button.dart';
import 'package:flutter_application_2/components/my_password_field.dart';
import 'package:flutter_application_2/components/my_textfield.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? onPressed;
  LoginScreen({super.key, required this.onPressed});
  //Login Method
  void login(BuildContext context) async {
    //auth Service
    final authService = AuthService();
    //Try Login
    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          e.toString(),
        ),
        duration: Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //logo
          Icon(
            Icons.chat,
            size: 60,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          //Side box
          SizedBox(
            height: 10,
          ),

          //Welcome Message
          Text(
            "Welcome Back User, you've been missed.",
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
          //Side box
          SizedBox(
            height: 10,
          ),

          //Email Text Field
          MyTextfield(
              hintText: 'Enter your email',
              controller: _emailController,
              obscureText: false,
              keyboardType: TextInputType.emailAddress),

          //Side box
          SizedBox(
            height: 10,
          ),

          //Password Text Field
          MyPasswordField(
              hintText: 'Enter your password', controller: _passwordController),

          //Side box
          SizedBox(
            height: 10,
          ),

          //Login Button
          MyButton(text: 'Login', onPressed: () {}),

          //Side box
          SizedBox(
            height: 10,
          ),

          //Register Text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account !",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              TextButton(
                  onPressed: onPressed,
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
