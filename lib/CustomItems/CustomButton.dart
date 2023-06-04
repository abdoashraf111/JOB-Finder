import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.text,
      required this.fun,
      required this.buttoncolor,
      required this.textcolor})
      : super(key: key);
  String text;
  var fun;
  Color buttoncolor;
  Color textcolor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Container(

        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(1000)),
          color: buttoncolor,
        ),
        child: Center(
            child: Text(
          text,
          style:  TextStyle(
              color: textcolor ,
              fontSize: 16),
        )),
      ),
    );
  }
}
