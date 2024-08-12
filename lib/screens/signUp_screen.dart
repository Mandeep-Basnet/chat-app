import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/auth/auth_service.dart';
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
  //Sign Up Method
  void signUp(BuildContext context) async {
    //Validate Password i.e. if both password and confirm is same
    if (_passwordController.text != _confirmPasswordController.text) {
      //Show Error
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Passwords do not match"),
        duration: Duration(seconds: 2),
      ));
      return;
    }
    //Show Loading Indicator
    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ));
    //auth Service
    final authService = AuthService();
    //Try Sign Up
    try {
      //Sign Up
      await authService.signUpWithEmailPassword(
          _emailController.text, _passwordController.text);
    }
    //Catch Error
    catch (e) {
      //Show Error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          e.toString(),
        ),
        duration: const Duration(seconds: 2),
      ));
      //hide loading indicator
      Navigator.pop(context);
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
          const SizedBox(
            height: 10,
          ),

          //Welcome Message
          Text(
            "Create a new account !",
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
          //Side box
          const SizedBox(
            height: 10,
          ),

          //Email Text Field
          MyTextfield(
              hintText: 'Enter your email',
              controller: _emailController,
              obscureText: false,
              keyboardType: TextInputType.emailAddress),

          //Side box
          const SizedBox(
            height: 10,
          ),

          //Password Text Field
          MyPasswordField(
              hintText: 'Enter your password', controller: _passwordController),

          //Side box
          const SizedBox(
            height: 10,
          ),

          //Confirm Password Text Field
          MyPasswordField(
              hintText: 'Confirm your password',
              controller: _confirmPasswordController),

          //Side box
          const SizedBox(
            height: 10,
          ),

          //Sign Up Button
          MyButton(text: 'Sign Up', onPressed: () => signUp(context)),

          //Side box
          const SizedBox(
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
