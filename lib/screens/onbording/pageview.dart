
import 'package:flutter/material.dart';

class Pageviews extends StatelessWidget {
  Pageviews({Key? key,
    required this.image,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.smalltext}) : super(key: key);
  String image;
  String text1;
  String text2;
  String text3;
  String smalltext;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        SizedBox(height: 24,),
        Padding(
          padding: const EdgeInsets.only(left: 24,right: 24),
          child: Column(
            children: [
              RichText(
                maxLines:3,
                textAlign: TextAlign.start,
                text:  TextSpan(
                    text: text1,style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: "lib/fonts/SFPRODISPLAYBLACKITALIC.OTF"
                ),
                    children: [
                      TextSpan(
                        text: text2,
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(
                          text: text3,
                          style: TextStyle(
                              color: Colors.black
                          ))]
                ),
              ),
              SizedBox(height: 12,),
              Text(smalltext,style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey
              ),)
            ],
          ),
        ),

      ],
    );
  }
}
