import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../CustomItems/CustomButton.dart';
import '../../Signin/Signin.dart';
import '../Checkemail.dart';
import '../passChangeDone.dart';
import 'new_pass_word_cubit.dart';

class NewPass extends StatelessWidget {
  var passwordcontroller1 = TextEditingController();
  var passwordcontroller2 = TextEditingController();
  GlobalKey<FormState> FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPassWordCubit,NewPassWordState>(
      builder: (context, state) {
      bool showPass1=BlocProvider.of<NewPassWordCubit>(context).showPass1;
      bool showPass2=BlocProvider.of<NewPassWordCubit>(context).showPass2;
      return  Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Form(
              key: FormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) =>CheckEmail() ,));
                          },
                          icon: const Icon(Icons.arrow_back)),
                      const Spacer(
                        flex: 1,
                      ),
                      Image.asset("lib/images/Logo1.png"),
                    ],
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  const Text("Create new password", style: TextStyle(fontSize: 28)),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                      "Set your new password so you can login and acces Jobsque",
                      style: TextStyle(color: Color(0xff6B7280), fontSize: 16)),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.length < 5) {
                        return "Password must be at least 8 characters";
                      } else {
                        return null;
                      }
                    },
                    controller: passwordcontroller1,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !showPass1,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: GestureDetector(
                            onTap: () {
                                BlocProvider.of<NewPassWordCubit>(context).showPassFun1();
                            },
                            child: Icon(showPass1 == false
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.length < 5) {
                        return "Both password must match";
                      } else {
                        return null;
                      }
                    },
                    controller: passwordcontroller2,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !showPass2,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              BlocProvider.of<NewPassWordCubit>(context).showPassFun2();
                            },
                            child: Icon(showPass2 == false
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
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
                      text: "Reset password",
                      fun: () {
                        if(FormKey.currentState!.validate()){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) =>PassDone() ,));
                        }
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
        ),
      );
    },

    );
  }
}
