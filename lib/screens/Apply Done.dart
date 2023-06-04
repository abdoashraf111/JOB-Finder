import 'package:flutter/material.dart';
import '../../CustomItems/CustomButton.dart';
import 'HomeScreen/HomeNavigationBar.dart';

class ApplyDone extends StatelessWidget {
  const ApplyDone({Key? key}) : super(key: key);

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
                      Navigator.of(context).pop();
                    },
                  ),
                  Text("Apply Job"),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              Image.asset("lib/images/Data Ilustration.png"),
              const SizedBox(
                height: 24,
              ),
               const Text("Your data has been",
                   style: TextStyle(fontSize: 24)),
              const Text("successfully sent",
                  style: TextStyle(fontSize: 24)),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                width: 300,
                child: Text("You will get a message from our team, about the announcement of employee acceptance",
                    style: TextStyle(fontSize: 14, color: Color(0xff6B7280))),
              ),
              const Spacer(
                flex: 1,
              ),
              CustomButton(
                  text: "Back to home",
                  fun: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) =>HomeNavigationBar(pageNumber: 0) ,));
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
