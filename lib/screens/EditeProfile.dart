import 'package:flutter/material.dart';
import '../CustomItems/CustomButton.dart';
import '../CustomItems/custom_icons.dart';
import 'HomeScreen/HomeNavigationBar.dart';

class EditeProfile extends StatelessWidget {
   EditeProfile({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(right: 24, left: 24),
                child: SingleChildScrollView(
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
                            const Text("Edite Profile"),
                            const Spacer(
                              flex: 4,
                            ),
                          ],
                        ),
                        const Center(
                          child: CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.black,
                            // backgroundImage: Image,
                            child: Icon(CustomIcons.camera),
                          ),
                        ),
                        Center(child: TextButton(onPressed: (){}, child: const Text("Change  Photo"))),
                        const SizedBox(height: 25,),
                        const Text("Name"),
                        const SizedBox(height: 8,),
                        TextFormField(
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
                              hintText: "name",
                              prefixIcon: const Icon(Icons.person_2_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                        ),
                        const SizedBox(height: 28,),
                        const Text("Bio"),
                        const SizedBox(height: 8,),
                        TextFormField(
                          validator: (value) {
                            if (value!.length < 5) {
                              return "it should more than 5 letters or numbers ";
                            } else {
                              return null;
                            }
                          },
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "email",
                              prefixIcon: const Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                        ),
                        const SizedBox(height: 28,),
                        const Text("Address"),
                        const SizedBox(height: 8,),
                        TextFormField(
                          validator: (value) {
                            if (value!.length < 5) {
                              return "it should more than 5 letters or numbers ";
                            } else {
                              return null;
                            }
                          },
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "email",
                              prefixIcon: const Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                        ),
                        const SizedBox(height: 28,),
                        const Text("No.Handphone*"),
                        const SizedBox(height: 8,),
                        TextFormField(

                          validator: (value) {
                            if (value!.length < 5) {
                              return "it should more than 5 letters or numbers ";
                            } else {
                              return null;
                            }
                          },
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintText: "Phone Number",
                              prefixIcon: const Icon(Icons.outlined_flag),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                        ),
                        const SizedBox(height: 83,),
                        CustomButton(
                            text: "Save",
                            fun: (){ Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomeNavigationBar(pageNumber: 0,)));},
                            buttoncolor: const Color(0xff3366FF),
                            textcolor: Colors.white)
                      ]),
                )
            )
        )
    );
  }
}
