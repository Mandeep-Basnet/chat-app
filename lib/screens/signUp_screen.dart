import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/my_button.dart';
import 'package:flutter_application_2/components/my_password_field.dart';
import 'package:flutter_application_2/components/my_textfield.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final void Function()? onPressed;
  SignupScreen({super.key, required this.onPressed});

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
            "Create a new account !",
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

          //Confirm Password Text Field
          MyPasswordField(
              hintText: 'Confirm your password',
              controller: _confirmPasswordController),

          //Side box
          SizedBox(
            height: 10,
          ),

          //Sign Up Button
          MyButton(text: 'Sign Up', onPressed: () {}),

          //Side box
          SizedBox(
            height: 10,
          ),

          //Login Text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account !",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              TextButton(
                  onPressed: onPressed,
                  child: Text(
                    "Log In",
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
