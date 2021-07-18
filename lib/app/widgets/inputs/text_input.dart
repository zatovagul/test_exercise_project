import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  final bool obscureText;
  const TextInput({Key key,@required this.controller, this.hint : "",
    this.keyboardType, this.obscureText:false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint
      ),
      obscureText: obscureText,
    );
  }
}
