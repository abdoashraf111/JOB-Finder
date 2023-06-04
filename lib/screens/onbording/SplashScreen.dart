import 'dart:async';

import 'package:flutter/material.dart';

import 'SlidingPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>SlidingPage() ,));
    });
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image:AssetImage("lib/images/Blur.png"),
              fit: BoxFit.cover),
        ),
          child: Center(child: Image.asset("lib/images/Logo.png"))),
    );
  }
}
