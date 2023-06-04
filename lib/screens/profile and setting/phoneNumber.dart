import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../CustomItems/CustomButton.dart';
import '../HomeScreen/ProfileScreen.dart';

class phoneNumber extends StatefulWidget {
   phoneNumber({Key? key}) : super(key: key);
  @override
  State<phoneNumber> createState() => _phoneNumberState();
}

class _phoneNumberState extends State<phoneNumber> {
  var phonecontroller = TextEditingController();
  bool valuee=false;
   GlobalKey<FormState> FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  Spacer(flex: 3,),
                  Text("Phone number",style: TextStyle(fontSize: 20)),
                  Spacer(flex: 4,),
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
                key: FormKey,
                child: TextFormField(
                  validator: (value) {
                    if (value == "") {
                      return "you should fill this ";
                    } else {
                      return null;
                    }
                  },
                  controller: phonecontroller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.flag),
                      hintText: "Phone....",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("Use the phone number to reset your \n password"),
                  Spacer(),
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
                    if(FormKey.currentState!.validate()){
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
