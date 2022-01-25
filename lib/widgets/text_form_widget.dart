
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  TextEditingController controller;
  String hint;
    TextFormWidget({Key? key,required this.controller,required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: false,
      decoration: InputDecoration(hintText:hint ),

    );
  }
}
