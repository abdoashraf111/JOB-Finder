import 'package:flutter/material.dart';
import '../../CustomItems/CustomButton.dart';
import '../Signin/Signin.dart';
import 'CreatAcount2.dart';


class CreateDone extends StatelessWidget {
  const CreateDone({Key? key}) : super(key: key);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_outlined, size: 24),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>const CreateAccount2() ,));
                    },
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              Image.asset("lib/images/Success Account Ilustration.png"),
              const SizedBox(
                height: 24,
              ),
              const Text("Your account has been set up!",
                  style: TextStyle(fontSize: 24)),
              const SizedBox(
                height: 8,
              ),
              const Text("We have customized feeds according to your",
                  style: TextStyle(fontSize: 14, color: Color(0xff6B7280))),
              const Text(" preferences",
                  style: TextStyle(fontSize: 14, color: Color(0xff6B7280))),
              const Spacer(
                flex: 1,
              ),
              CustomButton(
                  text: "Get Started",
                  fun: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>SignIn() ,));
                  },
                  buttoncolor: const Color(0xff3366FF),
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
