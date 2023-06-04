import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../CustomItems/CustomButton.dart';
import '../HomeScreen/ProfileScreen.dart';
import '../forgotpassword/Checkemail.dart';

class emailAddress extends StatelessWidget {
   emailAddress({Key? key}) : super(key: key);
  var emailcontroller = TextEditingController();
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
                  Text("Email address",style: TextStyle(fontSize: 20)),
                  Spacer(flex: 4,),
                ],
              ),
              const SizedBox(
                height: 44,
              ),
              const Text("Main e-mail address", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
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
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      hintText: "Enter your email....",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
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
