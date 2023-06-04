import 'package:flutter/material.dart';

import '../../../CustomItems/custom_icons.dart';
import '../EditeProfile.dart';
import '../Language.dart';
import '../Login and security.dart';
import '../Notification.dart';
import '../Portfolio.dart';
import 'HomeNavigationBar.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 195,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xffD6E4FF),
                  ),
                  const SizedBox(height: 52,),
                  const Text("Rafif Dian Axelingga"),
                  const Text("Senior UI/UX Designer"),
                  Container(
                    margin: const EdgeInsets.all(24),
                    padding: EdgeInsets.all(8),
                    height:68 ,
                    width: 327,
                    decoration: const BoxDecoration(
                      color: Colors.white
                      // Color(0xffFAFAFA)
                    ),
                    child:const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Column(
                          children: [
                            Text("Applied"),
                            Spacer(),
                            Text("25",style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Spacer(),
                        SizedBox(
                            height: 30,
                            width: 2,
                            child: Divider(height: 1,color: Colors.grey,thickness: 30,indent: 0)),
                        Spacer(),
                        Column(
                          children: [
                            Text("Reviewed"),
                            Spacer(),
                            Text("26",style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Spacer(),
                        SizedBox(
                            height: 30,
                            width: 2,
                            child: Divider(height: 1,color: Colors.grey,thickness: 30,indent: 0)),
                        Spacer(),
                        Column(
                          children: [
                            Text("Contacted"),
                            Spacer(),
                            Text("27",style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Spacer(),

                      ],
                    ) ,


                  ),
                  const SizedBox(height: 36,),
                  Row(
                    children: [
                      const SizedBox(width: 24,),
                      const Text("About"),
                      const Spacer(),
                      TextButton(onPressed: (){
                        showBottomSheet(
                            builder: (context) => Container(
                            height: 230,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                                border: Border.all(color: Colors.grey)
                        ),
                            child:Center(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 24,left: 24),
                                child:  TextFormField(
                                  onFieldSubmitted: (value) => Navigator.pop(context),
                                  strutStyle: StrutStyle(height: 5,),
                                  validator: (value) {
                                    if (value!.length < 5) {
                                      return "it should more than 5 letters or numbers ";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: nameController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                      hintText: "About",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      )),
                                ),),
                            ),
                            ),
                            context:context );
                      }, child: const Text("Edit")),
                      const SizedBox(width: 24,),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                    width:327 ,
                    child: Text("I'm Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of."),

                  ),
                  const SizedBox(height: 36,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 36,
                    color: Color(0xffE5E7EB),
                    child:const Padding(
                      padding: EdgeInsets.only(right:24 ,left: 24,),
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("General"),
                        ],
                      ),
                    ) ,
                  ),
                  const SizedBox(height: 30,),
                   Padding(
                     padding: const EdgeInsets.all(24),
                     child: Column(
                       children: [
                         Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Color(0xffD6E4FF),
                              radius: 25,
                              child:Icon(CustomIcons.profile) ,
                            ),
                            const SizedBox(width: 12,),
                            const Text("Edit Profile"),
                            const Spacer(),
                            IconButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditeProfile()));
                            }, icon: const Icon(Icons.arrow_forward))
                          ],
                  ),
                         const Padding(
                           padding: EdgeInsets.only(top: 14,bottom: 14),
                           child: Divider(height: 10,color: Colors.grey,thickness: 1,indent: 0),
                         ),
                         Row(
                           children: [
                             CircleAvatar(
                               backgroundColor: Color(0xffD6E4FF),
                               radius: 25,
                               child:Icon(CustomIcons.folder_favorite) ,
                             ),
                             SizedBox(width: 12,),
                             Text("Portfolio"),
                             Spacer(),
                             IconButton(onPressed: (){
                               Navigator.of(context).push(MaterialPageRoute(
                                   builder: (context) => Portfolio()));
                             }, icon: Icon(Icons.arrow_forward))
                           ],
                         ),
                         const Padding(
                           padding: EdgeInsets.only(top: 14,bottom: 14),
                           child: Divider(height: 10,color: Colors.grey,thickness: 1,indent: 0),
                         ),
                         Row(
                           children: [
                             CircleAvatar(
                               backgroundColor: Color(0xffD6E4FF),
                               radius: 25,
                               child:Icon(CustomIcons.global) ,
                             ),
                             SizedBox(width: 12,),
                             Text("Langauge"),
                             Spacer(),
                             IconButton(onPressed: (){
                               Navigator.of(context).push(MaterialPageRoute(
                                   builder: (context) => Language()));
                             }, icon: Icon(Icons.arrow_forward))
                           ],
                         ),
                          Padding(
                           padding: EdgeInsets.only(top: 14,bottom: 14),
                           child: Divider(height: 10,color: Colors.grey,thickness: 1,indent: 0),
                         ),
                         Row(
                           children: [
                             CircleAvatar(
                               backgroundColor: Color(0xffD6E4FF),
                               radius: 25,
                               child:Icon(CustomIcons.notification_1) ,
                             ),
                             SizedBox(width: 12,),
                             Text("Notification"),
                             Spacer(),
                             IconButton(onPressed: (){
                               Navigator.of(context).push(MaterialPageRoute(
                                   builder: (context) => NotificationScreen()));
                             }, icon: Icon(Icons.arrow_forward))
                           ],
                         ),
                         const Padding(
                           padding: EdgeInsets.only(top: 14,bottom: 14),
                           child: Divider(height: 10,color: Colors.grey,thickness: 1,indent: 0),
                         ),
                         Row(
                           children: [
                             const CircleAvatar(
                               backgroundColor: Color(0xffD6E4FF),
                               radius: 25,
                               child:Icon(CustomIcons.lock) ,
                             ),
                             const SizedBox(width: 12,),
                             const Text("Login and security"),
                             const Spacer(),
                             IconButton(onPressed: (){

                               Navigator.of(context).push(MaterialPageRoute(
                                   builder: (context) => LoginAndSecurity()));
                             }, icon: const Icon(Icons.arrow_forward))
                           ],
                         ),
                         const Padding(
                           padding: EdgeInsets.only(top: 14,bottom: 14),
                           child: Divider(height: 10,color: Colors.grey,thickness: 1,indent: 0),
                         ),

                       ],
                     ),
                   ),
                  const SizedBox(height: 30,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 36,
                    color: Color(0xffE5E7EB),
                    child:const Padding(
                      padding: EdgeInsets.only(right:24 ,left: 24,),
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Others"),
                        ],
                      ),
                    ) ,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Accesibility"),
                            Spacer(),
                            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 14,bottom: 14),
                          child: Divider(height: 10,color: Colors.grey,thickness: 1,indent: 0),
                        ),
                        Row(
                          children: [
                            Text("Help Center"),
                            Spacer(),
                            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 14,bottom: 14),
                          child: Divider(height: 10,color: Colors.grey,thickness: 1,indent: 0),
                        ),
                        Row(
                          children: [
                            Text("Terms & Conditions"),
                            Spacer(),
                            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 14,bottom: 14),
                          child: Divider(height: 10,color: Colors.grey,thickness: 1,indent: 0),
                        ),
                        Row(
                          children: [
                            Text("Privacy Policy"),
                            Spacer(),
                            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 14,bottom: 14),
                          child: Divider(height: 10,color: Colors.grey,thickness: 1,indent: 0),
                        ),


                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left:24 ,
                right: 24,
                top: 0,
                child: Column(
                  children: [
                    const SizedBox(height: 28,),
                    Row(
                      children: [
                        IconButton(
                          icon:  Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => HomeNavigationBar(pageNumber: 0),
                            ));
                          },
                        ),
                        const Spacer(),
                        const Text("Profile"),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(CustomIcons.logout,color: Colors.red,))
                      ],
                    ),
                    const SizedBox(height: 65,),
                    const CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ), ),
    );
  }
}
