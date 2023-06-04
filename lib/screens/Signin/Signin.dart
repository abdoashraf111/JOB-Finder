import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../CustomItems/CustomButton.dart';
import '../../../Services/sharedprefeances.dart';
import '../../../controller/data_cubit.dart';
import '../CreateAcount/CreateAccount.dart';
import '../HomeScreen/HomeNavigationBar.dart';
import '../forgotpassword/forgotpassword.dart';
import '../onbording/SlidingPage.dart';
import 'Cubit/sign_in_cubit.dart';

class SignIn extends StatelessWidget {
  final TextEditingController nameController =
      TextEditingController(text: MyCache.GetString(key: MyChachKey.name));
  final TextEditingController emailController =
      TextEditingController(text: MyCache.GetString(key: MyChachKey.email));
  final TextEditingController passwordController =
      TextEditingController(text: MyCache.GetString(key: MyChachKey.password));
  final  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignIn({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        bool clickEnable = BlocProvider.of<SignInCubit>(context).clickEnable;
        bool showPass = BlocProvider.of<SignInCubit>(context).showPass;
        bool? checkBox=BlocProvider.of<SignInCubit>(context).checkBox;
         checkBox = MyCache.GetBool(key: MyChachKey.checked);
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
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SlidingPage(),
                                ));
                              },
                              icon: const Icon(Icons.arrow_back,
                                  color: Colors.black)),
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
                      const Text("Login",
                          style: TextStyle(fontSize: 28, color: Colors.black)),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text("Please login to find your dream job",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          )),
                      const SizedBox(
                        height: 44,
                      ),
                      TextFormField(

                        onChanged: (value) {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<SignInCubit>(context)
                                .trueClickEnable();
                          } else {
                            BlocProvider.of<SignInCubit>(context)
                                .falseClickEnable();
                          }
                        },
                        validator: (value) {
                          if (value == "") {
                            return "you should fill this ";
                          } else {
                            return null;
                          }
                        },
                        controller: emailController,
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
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<SignInCubit>(context)
                                .trueClickEnable();
                          } else {
                            BlocProvider.of<SignInCubit>(context)
                                .falseClickEnable();
                          }
                        },
                        validator: (value) {
                          if (value!.length < 5) {
                            return "it should more than 5 letters or numbers ";
                          } else {
                            return null;
                          }
                        },
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !showPass,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  BlocProvider.of<SignInCubit>(context)
                                      .showPassFun();
                                },
                                child: Icon(showPass == false
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            shape: const ContinuousRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            value: checkBox,
                            onChanged: (value) {
                              if(value==false)
                              { BlocProvider.of<SignInCubit>(context).checkBoxFalse();}
                              else if (value==true)
                              { BlocProvider.of<SignInCubit>(context).checkBoxTrue();}

                            },
                            activeColor: Colors.blue,
                          ),
                          const Text("Remember me"),
                          const Spacer(
                            flex: 1,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ForgotPassword(),
                                ));
                              },
                              child: const Text("Forgot Password?"))
                        ],
                      ),
                      const SizedBox(
                        height: 160,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Dont’t have an account?",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14)),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CreateAccount(),
                                ));
                              },
                              child: const Text(
                                "Register",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: CustomButton(
                          text: "Login",
                          fun: () async {
                            if (formKey.currentState!.validate()) {
                              if (checkBox == true) {
                                BlocProvider.of<SignInCubit>(context).saveData(
                                    password: passwordController.text,
                                    name: nameController.text,
                                   email: emailController.text);
                              }
                               BlocProvider.of<SignInCubit>(context).trueClickEnable();
                              // Map<String,dynamic> data= await BlocProvider.of<DataCubit>(context).postAuth(
                              //     url: "http://164.92.246.77/api/auth/login",
                              //     body:{
                              //       "password": passwordcontroller.text,
                              //       "email": emailcontroller.text,
                              //     }, ) ;
                              BlocProvider.of<DataCubit>(context).getJob();
                               await BlocProvider.of<DataCubit>(context).postSignIn(
                                  password: passwordController.text, email: emailController.text);
                            var data=BlocProvider.of<DataCubit>(context).modelSign;
                           print(data.status);
                              if (data.status == true) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("you Sign in Successfully")));
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                  builder: (context) => HomeNavigationBar(pageNumber: 0),
                                ));
                                // BlocProvider.of<DataCubit>(context).getJob();
                              } else  {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "wrong password or wrong email")));
                              }

                            } else {
                              print("validation is wrong");
                            }
                            // await Signup();
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
                            "Or Login With Account",
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
                          Spacer(flex: 1,),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 154,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: const Color.fromRGBO(
                                          209, 213, 219, 1))),
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
                                      color: const Color.fromRGBO(
                                          209, 213, 219, 1))),
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
                          const Spacer(flex: 1,),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
