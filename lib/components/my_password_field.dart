import 'package:flutter/material.dart';

class MyPasswordField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  const MyPasswordField(
      {super.key, required this.hintText, required this.controller});

  @override
  State<MyPasswordField> createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  bool _isObscure = true;
  void _toggle() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: TextField(
          controller: widget.controller,
          obscureText: _isObscure,
          decoration: InputDecoration(
              hintText: widget.hintText,
              filled: true,
              fillColor: theme.colorScheme.tertiary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: _toggle,
              ))),
    );
  }
}
