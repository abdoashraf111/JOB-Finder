import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../CustomItems/custom_icons.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(right: 24, left: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon:
                                const Icon(Icons.arrow_back_outlined, size: 24),
                            color: Colors.black,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          const Spacer(
                            flex: 3,
                          ),
                          const Text("Portfolio"),
                          const Spacer(
                            flex: 4,
                          ),
                        ],
                      ),
                      const SizedBox(height: 36,),
                      const Text("Add portfolio here"),
                      const SizedBox(height: 16,),
                      DottedBorder(
                        color:Colors.blue ,
                        radius: const Radius.circular(8),
                        borderType: BorderType.RRect,
                        dashPattern: const [5],
                        child: Container(
                          width:MediaQuery.of(context).size.width ,
                          height: 221,
                          decoration: BoxDecoration(
                              color: const Color(0xffECF2FF),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor:const Color(0xffD6E4FF) ,
                                  child: Image.asset("lib/images/Vector.png"),
                                ),
                                const Spacer(),
                                const Text("Upload your other file"),
                                const Spacer(),
                                const Text("Max. file size 10 MB"),
                                const Spacer(),
                                Container(
                                  height: 40,
                                  width: 295,
                                  decoration:BoxDecoration(
                                      color:const Color(0xffD6E4FF),
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(color: Colors.blue)
                                  ) ,
                                  child: TextButton(
                                      onPressed: (){}, child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(CustomIcons.export_icon),
                                      Text("Add file"),
                                    ],
                                  )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 36,),
                      Container(
                        height:74 ,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Image.asset("lib/images/file.png"),
                              const SizedBox(width: 10,),
                              const Column(children: [
                                Text("Rafif Dian.CV"),
                                Text("CV.pdf 300KB"),
                              ],),
                              const Spacer(),
                              IconButton(onPressed: (){}, icon: const Icon(CustomIcons.edit_2,color: Colors.blue,)),
                              IconButton(onPressed: (){}, icon: const Icon(CustomIcons.close_circle,color: Colors.red,)),
                            ],
                          ),
                        ),
                      ),//(listview)

                    ])
            )
        )
    );
  }
}
