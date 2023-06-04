import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTypeOfWork extends StatefulWidget {
   CustomTypeOfWork({Key? key,required this.index}) : super(key: key);
int index;
  @override
  State<CustomTypeOfWork> createState() => _CustomTypeOfWorkState();
}

class _CustomTypeOfWorkState extends State<CustomTypeOfWork> {
List <bool>clicks=[
  false,
  false,
  false,
  false,
];
List names=[
  "Senior UX Designer",
  "Senior UI Designer",
  "Graphik Designer",
  "Front-End Developer",
];

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: const EdgeInsets.all(16),
      height:81 ,
      decoration: BoxDecoration(
        color:clicks[widget.index]==true?const Color(0xffD6E4FF):Colors.white ,
        border: Border.all(color:clicks[widget.index]==true? const Color(0xff3366FF):Colors.grey),
        borderRadius:const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
           Column(
            children: [
              Text(names[widget.index],style: const TextStyle(fontSize: 16,fontWeight:FontWeight.w500 )),
              const Spacer(),
              Text("CV.pdf . Portfolio.pdf",style: TextStyle(fontSize: 14)),
            ],
          ),
          const Spacer(),
          IconButton(onPressed: (){
            setState(() {
              for(int i=0 ;i<4;i++)
              {
                print("number is ${widget.index}");
                print(i);
                if(widget.index==i){clicks[i]=true;}
                else{clicks[i]=false;}
              }print("-------------");
            });

          },
              icon: clicks[widget.index]==true? Icon(Icons.circle,color: Colors.blue,)
                  : Icon(Icons.circle_outlined,color: Colors.grey,))
        ],
      ),
    );
  }
}
