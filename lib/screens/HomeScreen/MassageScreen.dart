import 'package:flutter/material.dart';

import '../../CustomItems/custom_icons.dart';
import 'HomeNavigationBar.dart';

class MassageScreen extends StatelessWidget {
   MassageScreen({Key? key}) : super(key: key);

  final List images=[
    "lib/images/chat/Dana Logo.png",
    "lib/images/chat/Facebook Logo.png",
    "lib/images/chat/Gojek Logo.png",
    "lib/images/chat/Shoope Logo.png",
    "lib/images/chat/Slack Logo.png",
    "lib/images/chat/Twitter Logo.png",
  ];
  final List tests=[
    "Twitter",
    "Gojek Indonesia",
    "Shoope",
    "Dana",
    "Slack",
    "Facebook",
  ];
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
                          Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HomeNavigationBar(pageNumber: 0),
                          ));
                          },
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                      const Text(
                        "Messsages",
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
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onFieldSubmitted: (value) {},
                          onChanged: (value){},
                          decoration: const InputDecoration(
                            prefixIcon: Icon(CustomIcons.search_normal),
                            hintText: "Search....",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 30,
                        child: CircleAvatar(
                          radius: 29,
                          backgroundColor: Colors.white,

                          child: Icon(CustomIcons.setting_4),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 550,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            InkWell(
                              onTap: () {
                                showBottomSheet(
                                    context: context,
                                    builder: (context) =>   Container(
                                      height: 300,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                                          border: Border.all(color: Colors.grey)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 24,left: 24),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 10,),
                                            const SizedBox(
                                                width: 100,
                                                child: Divider(height: 10,color: Colors.black,thickness: 2,)),
                                            const SizedBox(height: 10,),
                                            const Text("Message filters"),
                                            const SizedBox(height: 16,),
                                            InkWell(
                                              onTap: (){
                                                Navigator.pop(context);

                                              },
                                              child: Container(height: 50,decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(100),
                                                  border: Border.all(color: Colors.grey)),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(15),
                                                  child: Row(children: [Icon(CustomIcons.directbox_default_2),
                                                    SizedBox(width: 20,),
                                                    Text("Unread"),
                                                    Spacer(),
                                                    Icon(Icons.arrow_forward_ios_outlined)
                                                  ]),
                                                ),),
                                            ),
                                            const SizedBox(height: 10,),
                                            InkWell(
                                              onTap: (){},
                                              child: Container(height: 50,decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(100),
                                                  border: Border.all(color: Colors.grey)),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(15),
                                                  child: Row(children: [Icon(CustomIcons.export_icon),
                                                    SizedBox(width: 20,),
                                                    Text("Spam"),
                                                    Spacer(),
                                                    Icon(Icons.arrow_forward_ios_outlined)
                                                  ]),
                                                ),),
                                            ),
                                            const SizedBox(height: 10,),
                                            InkWell(
                                              onTap: ()async{
                                                Navigator.pop(context);
                                              },
                                              child: Container(height: 50,decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(100),
                                                  border: Border.all(color: Colors.grey)),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(15),
                                                  child: Row(children: [Icon(CustomIcons.archive_minus),
                                                    SizedBox(width: 20,),
                                                    Text("Archived"),
                                                    Spacer(),
                                                    Icon(Icons.arrow_forward_ios_outlined)
                                                  ]),
                                                ),),
                                            ),
                                            const SizedBox(height: 10,),
                                          ],
                                        ),
                                      ),
                                    ));
                              },
                              child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                              height: 50,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 24,
                                    child: Image.asset(images[index]),
                                  ),
                                  const SizedBox(width: 16,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(tests[index],style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                      )),
                                   const Spacer(),
                                      const Text("Thank You David!")
                                    ],
                                  ),
                                  const Spacer(),
                                  const Text("12.39"),
                                ],
                              ),
                          ),
                        ),
                            ),
                        separatorBuilder: (context, index) => const Divider(height: 10,color: Colors.grey),
                        itemCount: 6),
                  )

                ]
                )
        )
    );
  }
}
