import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomWorkers extends StatelessWidget {
  const CustomWorkers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: 327,
      child: Row(
        children: [
          Image.asset("lib/images/Dimas Profile.png"),
          const Spacer(),
          const Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dimas Adi Saputro"),
              Spacer(),
              Text("Senior UI/UX Designer at Twitter"),

            ],
          ),
          const Spacer(),
          const Column(
            children: [
              Text("Work during"),
              Spacer(),
              Text("5 Years",style: TextStyle(
                color: Colors.blue
              ),)
            ],
          )
        ],
      ),
    );
  }
}
