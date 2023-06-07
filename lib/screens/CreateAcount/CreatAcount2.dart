// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../CustomItems/Custom_Card/Custom_Card.dart';

import '../../CustomItems/CustomButton.dart';
import 'CreateDone.dart';

class CreateAccount2 extends StatefulWidget {
  const CreateAccount2({Key? key}) : super(key: key);

  @override
  State<CreateAccount2> createState() => _CreateAccount2State();
}

class _CreateAccount2State extends State<CreateAccount2> {
  bool ontap = false;
  int groupValue = 0;
  int numpage = 0;
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 24, left: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                  numpage == 0
                      ? "What type of work are you interested in?"
                      : "Where are you prefefred Location?",
                  style: const TextStyle(
                    fontSize: 24,
                  )),
              const SizedBox(
                height: 12,
              ),
              Text(
                  numpage == 0
                      ? "Tell us what you’re interested in so we can customise the app for your needs."
                      : "Let us know, where is the work location you want at this time, so we can adjust it.",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff737379),
                  )),
              const SizedBox(
                height: 36,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 509,
                child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(() {
                        numpage = value;
                      });
                    },
                    children: [
                      GridView.builder(
                        itemCount: 6,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 140,
                          mainAxisSpacing:20,
                          crossAxisSpacing: 15
                        ),
                        itemBuilder: (context, index) => CustomCard(
                          index: index,
                        ),
                      ),
                      Column(
                        children: [
                          CupertinoSlidingSegmentedControl(
                              backgroundColor: const Color(0xffF4F4F5),
                              thumbColor: const Color(0xff091A7A),
                              padding: const EdgeInsets.all(4),
                              groupValue: groupValue,
                              children: {
                                0: SizedBox(
                                  width: 200,
                                  height: 50,
                                  child: Center(
                                      child: Text(
                                    "Work From Office",
                                    style: TextStyle(
                                        color: groupValue == 1
                                            ? Colors.black
                                            : Colors.white),
                                  )),
                                ),
                                1: SizedBox(
                                  width: 200,
                                  height: 50,
                                  child: Center(
                                      child: Text(
                                    "Remote Work",
                                    style: TextStyle(
                                        color: groupValue == 0
                                            ? Colors.black
                                            : Colors.white),
                                  )),
                                ),
                              },
                              onValueChanged: (value) {
                                setState(() {
                                  groupValue = value!;
                                });
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("Select the country you want for your job",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16)),
                          const SizedBox(
                            height: 36,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  CustomCity(index: 0),
                                  CustomCity(index: 1),
                                ],
                              ),
                              Row(
                                children: [
                                  CustomCity(index: 2),
                                  CustomCity(index: 3),
                                ],
                              ),
                              Row(
                                children: [
                                  CustomCity(index: 4),
                                  CustomCity(index: 5),
                                ],
                              ),
                              Row(
                                children: [
                                  CustomCity(index: 6),
                                  CustomCity(index: 7),
                                  CustomCity(index: 8),
                                ],
                              ),
                              Row(
                                children: [
                                  CustomCity(index: 9),
                                  CustomCity(index: 10),
                                ],
                              ),
                              Row(
                                children: [
                                  CustomCity(index: 11),
                                  CustomCity(index: 12),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
              ),
              const Spacer(
                flex: 1,
              ),
              CustomButton(
                  text: "Next",
                  fun: () {
                    if (numpage == 1) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>const CreateDone() ,));
                    } else {
                      _controller.nextPage(
                          duration: const Duration(seconds: 1), curve: Curves.linear);
                    }
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
