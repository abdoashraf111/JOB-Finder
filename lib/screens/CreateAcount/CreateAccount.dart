import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../CustomItems/CustomButton.dart';
import '../../../Services/sharedprefeances.dart';
import '../../controller/data_cubit.dart';
import '../Signin/Signin.dart';

import '../onbording/SlidingPage.dart';
import 'CreatAcount2.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool _sufvar = false;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool clickEnable = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int passWrong = 2;
  bool passActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) =>SlidingPage() ,));
                          },
                          icon: const Icon(Icons.arrow_back, color: Colors.black)),
                      const Spacer(
                        flex: 1,
                      ),
                      Image.asset(
                        "lib/images/Logo1.png",
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text("Create Account",
                      style: TextStyle(fontSize: 28, color: Colors.black)),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text("Please create an account to find your dream job",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      )),
                  const SizedBox(
                    height: 44,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            clickEnable = true;
                          });
                        } else {
                          clickEnable = false;
                        }
                      });
                    },
                    validator: (value) {
                      if (value == "") {
                        return "you should fill this ";
                      } else {
                        return null;
                      }
                    },
                    controller: namecontroller,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_outline),
                        hintText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (formKey.currentState!.validate()) {
                          clickEnable = true;
                        } else {
                          clickEnable = false;
                        }
                      });
                    },
                    validator: (value) {
                      if (EmailValidator.validate(emailcontroller.text.trim())) {
                        return null ;
                      } else {
                        return "Email Account is not accept ";
                      }
                    },
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (formKey.currentState!.validate()) {
                          clickEnable = true;
                        } else {
                          clickEnable = false;
                        }
                      });
                      setState(() {
                        if (passActive == true) {
                          if (value.length < 8) {
                            passWrong = 1;
                            return;
                          }
                          else {
                            passWrong = 0;
                            return;
                          }
                        }
                        else {
                          passWrong = 2;
                        }
                      });
                    },
                    validator: (value) {
                      setState(() {
                        if (value!.length < 8) {
                          passWrong = 1;
                          return;
                        } else {
                          passWrong = 0;
                          return;
                        }
                      });
                      return null;
                    },
                    onTap: () {
                      setState(() {
                        passActive = true;
                      });
                    },
                    controller: passwordcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_sufvar,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _sufvar = !_sufvar;
                              });
                            },
                            child: Icon(_sufvar == false
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text("Password must be at least 8 characters",
                      style: TextStyle(
                        color: passWrong == 0
                            ? Colors.green
                            : passWrong == 1
                                ? Colors.red
                                : Colors.grey,
                        fontSize: 16,
                      )),
                  const SizedBox(
                    height: 105,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?",
                          style: TextStyle(color: Colors.grey, fontSize: 14)),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) =>SignIn() ,));
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.blue, fontSize: 14),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: CustomButton(
                      text: "Create account",
                      fun: () async {
                        if (formKey.currentState!.validate()) {
                          MyCache.SetString(
                              key: MyChachKey.password,
                              value: passwordcontroller.text);
                          MyCache.SetString(
                              key: MyChachKey.name, value: namecontroller.text);
                          MyCache.SetString(
                              key: MyChachKey.email,
                              value: emailcontroller.text);
                         await BlocProvider.of<DataCubit>(context).postRegister(
                           name: namecontroller.text,
                              email: emailcontroller.text,
                              password: passwordcontroller.text,);
                         var data=BlocProvider.of<DataCubit>(context).modelRegister.status;
                          if (data == false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content:Text("The email has already been taken") ));
                          } else if (data == true) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content:Text("The email has already been taken") ));
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) =>const CreateAccount2() ,));
                          } else {

                          }
                        }
                      },
                      buttoncolor: clickEnable == true
                          ? const Color(0xff3366FF)
                          : const Color.fromRGBO(209, 213, 219, 1),
                      textcolor: clickEnable == true
                          ? Colors.white
                          : const Color.fromRGBO(107, 114, 128, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 10,
                          color: Colors.grey,
                          endIndent: 20,
                          thickness: 1,
                        ),
                      ),
                      Text(
                        "Or Sign up With Account",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Expanded(
                        child: Divider(
                          height: 10,
                          color: Colors.grey,
                          indent: 20,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 154,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: const Color.fromRGBO(209, 213, 219, 1))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("lib/images/google.png"),
                              const Text(
                                "Google",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 19,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 154,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: const Color.fromRGBO(209, 213, 219, 1))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("lib/images/Facebook.png"),
                              const Text(
                                "Facebook",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// Signup(){
//   Api().post(url: url, body: body, token: token)
// }
