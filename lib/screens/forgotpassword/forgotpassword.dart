import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../CustomItems/CustomButton.dart';
import '../Signin/Signin.dart';
import 'Checkemail.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
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
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) =>SignIn() ,));
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const Spacer(
                    flex: 1,
                  ),
                  Image.asset("lib/images/Logo1.png"),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text("Reset Password", style: TextStyle(fontSize: 28)),
              const SizedBox(
                height: 8,
              ),
              const Text(
                  "Enter the email address you used when you joined and we’ll send you instructions to reset your password.",
                  style: TextStyle(color: Color(0xff6B7280), fontSize: 16)),
              const SizedBox(
                height: 40,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You remember your password",
                      style: TextStyle(color: Color(0xff9CA3AF))),
                  TextButton(
                    child: const Text("Login"),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>SignIn() ,));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: "Request password reset",
                  fun: () async{
                    if(FormKey.currentState!.validate()){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>CheckEmail() ,));
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
