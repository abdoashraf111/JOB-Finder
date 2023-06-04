import 'package:flutter/material.dart';
import '../../../CustomItems/CustomButton.dart';
import '../HomeScreen/HomeNavigationBar.dart';


class PassDone extends StatelessWidget {
  const PassDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 24, left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24,
              ),

              const Spacer(
                flex: 1,
              ),
              Image.asset("lib/images/Password Succesfully Ilustration.png"),
              const SizedBox(
                height: 24,
              ),
              const Text("Password changed",
                  style: TextStyle(fontSize: 24)),
              const Text("succesfully!",
                  style: TextStyle(fontSize: 24)),
              const SizedBox(
                height: 8,
              ),
              const Text("Your password has been changed successfully, we will let you know if there are more problems",
                  style: TextStyle(fontSize: 16, color: Color(0xff6B7280))),
              const Text("with your account",
                  style: TextStyle(fontSize: 16, color: Color(0xff6B7280))),
              const Spacer(
                flex: 1,
              ),
              CustomButton(
                  text: "Get Started",
                  fun: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>HomeNavigationBar(pageNumber: 0) ,));
                  },
                  buttoncolor: Color(0xff3366FF),
                  textcolor: Colors.white),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),

    );
  }
}
