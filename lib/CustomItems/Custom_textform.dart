import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  CustomTextForm({
    Key? key,
    required this.controller,
    required this.validator,
    required this.prefix,
    required this.suffix,
  }) : super(key: key);
  TextEditingController controller;
  var validator;
  Widget prefix;
  Widget suffix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: suffix,
          // hintText: ,
          // errorText: ,
          // helperText: ,
          // labelText: ,
          // counterText: ,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    );
  }
}
