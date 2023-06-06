import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joobfinder/screens/HomeScreen/HomeNavigationBar.dart';

class AppliedScreen extends StatefulWidget {
  AppliedScreen({Key? key}) : super(key: key);

  @override
  State<AppliedScreen> createState() => _AppliedScreenState();
}

class _AppliedScreenState extends State<AppliedScreen> {
  int groupValue = 0;
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(right: 24, left: 24),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeNavigationBar(pageNumber: 0),));

                    },
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  const Text(
                    "Applied Job",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                ],
              ),
                    const SizedBox(
                     height: 50,
                     ),
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
                        "Desicription",
                        style: TextStyle(
                            color:
                                groupValue == 0 ? Colors.white : Colors.black),
                      )),
                    ),
                    1: SizedBox(
                      width: 200,
                      height: 50,
                      child: Center(
                          child: Text(
                        "Company",
                        style: TextStyle(
                            color:
                                groupValue == 1 ? Colors.white : Colors.black),
                      )),
                    ),
                  },
                  onValueChanged: (value) {
                    if (value == 0) {
                      _controller.jumpToPage(0);
                    }
                    if (value == 1) {
                      _controller.jumpToPage(1);
                    }
                  }),
                   SizedBox(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: PageView(
                  controller: _controller,
                  onPageChanged: (value) {
                    setState(() {
                      groupValue = value;
                    });
                  },
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("lib/images/no applyed.png"),
                          const Text("No applications were applied",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500)),
                          const SizedBox(height: 20,),
                          const SizedBox(
                            width: 324,
                            child: Column(
                              children: [
                                Text("there are not applied applications",
                                  style:TextStyle(fontSize: 16,color: Colors.grey) ,),

                              ],
                            ),

                          )
                        ]),
                    Column(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Image.asset("lib/images/no applyed.png"),
                      Text("No applications were rejected",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500)),
                      SizedBox(height: 20,),
                          SizedBox(
                              width: 324,
                              child: Column(
                                children: [
                                  Text("If there is an application that is rejected by ",
                                    style:TextStyle(fontSize: 16,color: Colors.grey) ,),
                                  Text("the company it will appear here",
                                    style:TextStyle(fontSize: 16,color: Colors.grey) ,),
                                ],
                              ),

                          )
                    ]),

                  ],
                ),
              )
            ])));
  }
}
