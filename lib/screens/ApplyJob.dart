import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../CustomItems/CustomButton.dart';
import '../../CustomItems/Custom_Card/Custom_Card.dart';
import '../../CustomItems/custom_icons.dart';
import '../CustomItems/Custom_TypeOfWork.dart';
import 'Apply Done.dart';

class ApplyJob extends StatefulWidget {
   ApplyJob({Key? key}) : super(key: key);

  @override
  State<ApplyJob> createState() => _ApplyJobState();
}

class _ApplyJobState extends State<ApplyJob> {
  final _controller = PageController();

   final TextEditingController nameController = TextEditingController();

   final TextEditingController emailController = TextEditingController();

   final TextEditingController phoneController = TextEditingController();

   GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int numPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24,right: 24,top: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {if(numPage==0)
                      {Navigator.of(context).pop();}
                        else {
                          _controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);}
                      },
                    ),
                    const Spacer(flex: 3,),
                    const Text("Apply Job",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
                    const Spacer(flex: 4,),

                  ],
                ),
                const SizedBox(height: 40,),
                 Row(
                  children: [
                    Spacer(),
                     Column(
                      children: [
                       numPage==0? const CircleAvatar(
                          child: CircleAvatar(
                            child: Center(
                              child: Text("1"),
                            ),
                            backgroundColor: Colors.white,
                            radius: 21.5,
                          ),radius: 23,
                          backgroundColor: Colors.blue,
                        )
                           :const CircleAvatar(
                         radius: 23,
                         backgroundColor: Colors.blue,
                         child: Icon(Icons.done,color: Colors.white,),
                       ),
                        const SizedBox(height: 10,),
                        const Text("Biodata",style: TextStyle(fontSize: 12,color: Colors.blue)),
                      ],
                    ),
                    const Spacer(),
                    Text("-----",style: TextStyle(color: numPage==0?Colors.grey:Colors.blue)),
                    const Spacer(),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 23,
                          backgroundColor:numPage==1?Colors.blue:numPage==2?Colors.blue:Colors.grey ,
                          child: CircleAvatar(
                            backgroundColor: numPage==2?Colors.blue:Colors.white,
                            child: numPage==2?Icon(Icons.done,color: Colors.white,)
                            :Center(child: Text("2",style: TextStyle(color: numPage==1?Colors.blue:Colors.grey),)),
                            radius: 21.5,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text("Type of work",style: TextStyle(fontSize: 12,
                            color: numPage==1?Colors.blue :numPage==2?Colors.blue:Colors.grey)),
                      ],
                    ),
                    const Spacer(),
                    Text("-----",style: TextStyle(color: numPage==2?Colors.blue:Colors.grey)),
                    const Spacer(),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 23,
                          backgroundColor: numPage==2?Colors.blue:Colors.grey,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Center(child: Text("3",style: TextStyle(color: numPage==2?Colors.blue:Colors.grey),)),
                            radius: 21.5,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text("Upload portfolio",
                            style: TextStyle(fontSize: 12,color: numPage==2?Colors.blue:Colors.grey)),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 32,),
                SizedBox(
                    height:500 ,
                    width: MediaQuery.of(context).size.width,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _controller,
                      onPageChanged: (value) {
                          setState(() {
                            numPage = value;
                          });
                      },
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Bio data",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                              )),
                              Text("Fill in your bio data correctly"),
                              SizedBox(height: 28,),
                              Text("Full Name*"),
                              SizedBox(height: 8,),
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
                              SizedBox(height: 28,),
                              Text("Email*"),
                              SizedBox(height: 8,),
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
                              SizedBox(height: 28,),
                              Text("No.Handphone*"),
                              SizedBox(height: 8,),
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

                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Type of work",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                            )),
                            const Text("Fill in your bio data correctly"),
                            const SizedBox(height: 28,),
                              SizedBox(
                                height: 430,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) => const SizedBox(height: 20,),
                                    itemBuilder:  (context, index) =>
                                    CustomTypeOfWork(index: index),
                                  itemCount: 4,
                                ),
                              )


                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Upload portfolio",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                            )),
                            Text("Fill in your bio data correctly"),
                            SizedBox(height: 28,),
                            Text("Upload CV*"),
                            SizedBox(height: 12,),
                            Container(
                              height:74 ,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    Image.asset("lib/images/file.png"),
                                    SizedBox(width: 10,),
                                    Column(children: [
                                      Text("Rafif Dian.CV"),
                                      Text("CV.pdf 300KB"),
                                    ],),
                                    Spacer(),
                                    IconButton(onPressed: (){}, icon: Icon(CustomIcons.edit_2,color: Colors.blue,)),
                                    IconButton(onPressed: (){}, icon: Icon(CustomIcons.close_circle,color: Colors.red,)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text("Other File"),
                            SizedBox(height: 12,),
                            DottedBorder(
                              color:Colors.blue ,
                              radius: Radius.circular(8),
                              borderType: BorderType.RRect,
                              dashPattern: [5],
                              child: Container(
                                width:MediaQuery.of(context).size.width ,
                                height: 221,
                                decoration: BoxDecoration(
                                  color: Color(0xffECF2FF),
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundColor:Color(0xffD6E4FF) ,
                                        child: Image.asset("lib/images/Vector.png"),
                                      ),
                                      Spacer(),
                                      Text("Upload your other file"),
                                      Spacer(),
                                      Text("Max. file size 10 MB"),
                                      Spacer(),
                                      Container(
                                        height: 40,
                                        width: 295,
                                        decoration:BoxDecoration(
                                          color:Color(0xffD6E4FF),
                                          borderRadius: BorderRadius.circular(100),
                                          border: Border.all(color: Colors.blue)
                                        ) ,
                                        child: TextButton(
                                            onPressed: (){}, child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(CustomIcons.export_icon),
                                            Text("Add file"),
                                          ],
                                        )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )



                          ],
                        )

                      ],
                    )),
                CustomButton(
                    text: "Next",
                    fun: (){
                      if(numPage==2){

                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) =>const ApplyDone() ,));

                      }
                      else if(numPage==0) {
                        if (formKey.currentState!.validate()) {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                        }
                      }
                      else{_controller.nextPage(
                          duration: const Duration(milliseconds: 300,),
                          curve: Curves.linear);}
                    },
                    buttoncolor: Colors.blue,
                    textcolor: Colors.white),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
