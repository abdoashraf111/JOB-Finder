import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'custom_icons.dart';

class CustomCredit extends StatelessWidget {
   CustomCredit({Key? key,required this.colorBack,required this.colorText}) : super(key: key);
Color colorBack;
Color colorText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 183,
      width: 300,
      decoration: BoxDecoration(
        color: colorBack,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(children: [
              Image.asset("lib/images/Zoom Logo.png"),
              const SizedBox(width: 16,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Designer",style: TextStyle(
                      color: colorText,fontSize: 18)),
                  const SizedBox(height: 4,),
                  const Text("Zoom • United States",style: TextStyle(
                      color: Color(0xff9CA3AF),fontSize: 12)),
                ],
              ),
              const SizedBox(width: 32,),
              Icon(CustomIcons.archive_minus,color: colorText,),
            ],),
            const Spacer(flex: 1,),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 87,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color:Color.fromRGBO (255, 255, 255, 0.14),),
                child: Center(child: Text("Fulltime",style: TextStyle(color: colorText))),),
                const Spacer(flex: 1,),
                Container(
                  height: 30,
                  width: 87,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Color.fromRGBO (255, 255, 255, 0.14),),
                  child: Center(child: Text("Remote",style: TextStyle(color: colorText))),),
                const Spacer(flex: 1,),
                Container(
                  height: 30,
                  width: 87,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Color.fromRGBO (255, 255, 255, 0.14),
                ),
                  child: Center(child: Text("Design",style: TextStyle(color: colorText))),),
              ],
            ),
            const Spacer(flex: 1,),
            Row(children: [
               Text("\$12K-15K",style: TextStyle(color: colorText,fontSize: 20)),
               Text("/Month",style: TextStyle(color: colorText,fontSize: 12)),
              const Spacer(flex: 1,),
              Container(
                width: 96,
                height: 32,
                decoration: const BoxDecoration(
                  color: Color(0xff3366FF),
                  borderRadius: BorderRadius.all(Radius.circular(1000)),
                ),
                child: Center(child: Text("Apply now",style: TextStyle(color: colorText))),
              ),
            ],)
          ],
        ),
      ),
    );
  }
}
