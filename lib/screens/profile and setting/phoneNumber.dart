import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../CustomItems/CustomButton.dart';
import '../HomeScreen/ProfileScreen.dart';

// ignore: camel_case_types
class phoneNumber extends StatefulWidget {
   const phoneNumber({Key? key}) : super(key: key);
  @override
  State<phoneNumber> createState() => _phoneNumberState();
}

// ignore: camel_case_types
class _phoneNumberState extends State<phoneNumber> {
  var phoneController = TextEditingController();
  bool valuee=false;
   GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const Spacer(flex: 3,),
                  const Text("Phone number",style: TextStyle(fontSize: 20)),
                  const Spacer(flex: 4,),
                ],
              ),
              const SizedBox(
                height: 44,
              ),
              const Text("Main phone number", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
              const SizedBox(
                height: 8,
              ),
              Form(
                key: formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value == "") {
                      return "you should fill this ";
                    } else {
                      return null;
                    }
                  },
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.flag),
                      hintText: "Phone....",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  const Text("Use the phone number to reset your \n password"),
                  const Spacer(),
                  CupertinoSwitch(
                      activeColor: Colors.blue,
                      value:valuee ,
                      onChanged: (value) {
                        setState(() {
                          valuee = value;
                        });
                      })


                ],
              ),
              const Spacer(
                flex: 1,
              ),


              CustomButton(
                  text: "Save",
                  fun: () async{
                    if(formKey.currentState!.validate()){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>ProfileScreen() ,));
                    }
                    // await BlocProvider.of<DataCubit>(context).sendEmail(email: emailcontroller.text);

                  },
                  buttoncolor: const Color(0xff3366FF),
                  textcolor: Colors.white),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
