import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool val = false;
  List butt = [
    false,
    false,
    false,
    false,
    false,
  ];
  List name = [
    "Your Job Search Alert",
    "Job Application Update",
    "Job Application Reminders",
    "Jobs You May Be Interested In",
    "Job Seeker Updates",
  ];
  List otherButt = [
    false,
    false,
    false,
  ];
  List otherName = [
    "Show Profile",
    "All Message",
    "Message Nudges",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(
                    height: 24,
                    ),
                 Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                   child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                       IconButton(
                           icon: const Icon(Icons.arrow_back_outlined, size: 24),
                          color: Colors.black,
                         onPressed: () {
                            Navigator.of(context).pop();
                            },
                     ),
                      const Spacer(
                        flex: 3,
                       ),
                      const Text("Notification"),
                       const Spacer(
                        flex: 4,
              ),
          ],
        ),
                    ),
                  const SizedBox(
                  height: 50,
                  ),
              Container(
        width: MediaQuery.of(context).size.width,
        height: 36,
        color: Color(0xffE5E7EB),
        child: const Padding(
          padding: EdgeInsets.only(
            right: 24,
            left: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Job notification"),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 24, left: 24),
        child: SizedBox(
          height: 62 * 5,
          child: ListView.separated(
              itemBuilder: (context, index) => Row(
                    children: [
                      Text(name[index]),
                      Spacer(),
                      CupertinoSwitch(
                          activeColor: Colors.blue,
                          value: butt[index],
                          onChanged: (value) {
                            setState(() {
                              butt[index] = value;
                            });
                          })
                    ],
                  ),
              separatorBuilder: (context, index) => Column(
                    children: [
                      const Divider(
                        height: 20,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
              itemCount: 5),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 36,
        color: Color(0xffE5E7EB),
        child: const Padding(
          padding: EdgeInsets.only(
            right: 24,
            left: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Other notification"),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 24, left: 24),
        child: SizedBox(
          height: 62 * 3,
          child: ListView.separated(
              itemBuilder: (context, index) => Row(
                    children: [
                      Text(otherName[index]),
                      Spacer(),
                      CupertinoSwitch(
                          activeColor: Colors.blue,
                          value: otherButt[index],
                          onChanged: (value) {
                            setState(() {
                              otherButt[index] = value;
                            });
                          })
                    ],
                  ),
              separatorBuilder: (context, index) => const Column(
                    children: [
                      Divider(
                        height: 20,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
              itemCount: 3),
        ),
      ),
    ])));
  }
}
