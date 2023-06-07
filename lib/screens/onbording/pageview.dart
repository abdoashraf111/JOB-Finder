
import 'package:flutter/material.dart';

class Pageviews extends StatelessWidget {
  const Pageviews({Key? key,
    required this.image,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.smallText}) : super(key: key);
  final String image;
  final String text1;
  final String text2;
  final String text3;
  final String smallText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        const SizedBox(height: 24,),
        Padding(
          padding: const EdgeInsets.only(left: 24,right: 24),
          child: Column(
            children: [
              RichText(
                maxLines:3,
                textAlign: TextAlign.start,
                text:  TextSpan(
                    text: text1,style: const TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: "lib/fonts/SFPRODISPLAYBLACKITALIC.OTF"
                ),
                    children: [
                      TextSpan(
                        text: text2,
                        style: const TextStyle(color: Colors.blue),
                      ),
                      TextSpan(
                          text: text3,
                          style: const TextStyle(
                              color: Colors.black
                          ))]
                ),
              ),
              const SizedBox(height: 12,),
              Text(smallText,style: const TextStyle(
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
