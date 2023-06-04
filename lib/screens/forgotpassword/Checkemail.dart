import 'package:flutter/material.dart';
import '../../../CustomItems/CustomButton.dart';
import 'newpassword/newpassword.dart';


class CheckEmail extends StatelessWidget {
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
              Image.asset("lib/images/Email Ilustration.png"),
              const SizedBox(
                height: 24,
              ),
              const Text("Check your Email",
                  style: TextStyle(fontSize: 24)),
              const SizedBox(
                height: 8,
              ),
              const Text("We have sent a reset password to your email",
                  style: TextStyle(fontSize: 14, color: Color(0xff6B7280))),
              const Text("address",
                  style: TextStyle(fontSize: 14, color: Color(0xff6B7280))),
              const Spacer(
                flex: 1,
              ),
              CustomButton(
                  text: "Open email app",
                  fun: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>NewPass() ,));

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
