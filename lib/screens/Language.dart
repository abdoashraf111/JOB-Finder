import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Language extends StatefulWidget {
   Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  List image=[
    "lib/images/languages/1 England.png",
    "lib/images/languages/2 Indonesia.png",
    "lib/images/languages/3 Saudi Arabia.png",
    "lib/images/languages/4 China.png",
    "lib/images/languages/5 Dutch.png",
    "lib/images/languages/6 France.png",
    "lib/images/languages/7 Germany.png",
    "lib/images/languages/8 Japan.png",
    "lib/images/languages/9 South Korea.png",
    "lib/images/languages/10 Portugal.png",

  ];

   List press=[
     true,
     false,
     false,
     false,
     false,
     false,
     false,
     false,
     false,
     false,
   ];

  List text=[
    "English",
    "Indonesia",
    "Arabic",
    "Chinese",
    "Dutch",
    "French",
    "German",
    "Japanese",
    "Korean",
    "Portuguese",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(right: 24, left: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon:
                            const Icon(Icons.arrow_back_outlined, size: 24),
                            color: Colors.black,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          const Spacer(
                            flex: 3,
                          ),
                          const Text("Language"),
                          const Spacer(
                            flex: 4,
                          ),

                        ],
                      ),
                      SizedBox(height: 50,),
                      SizedBox(
                        height: 650,
                        child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Row(
                              children: [
                                Image.asset(image[index]),
                                Spacer(),
                                Text(text[index]),
                                Spacer(),
                                IconButton(onPressed: (){
                                    setState(() {
                                      for(int i=0 ;i<10;i++)
                                        {
                                          if(i==index)
                                            {
                                              press[i]=true;
                                            }
                                          else{
                                            press[i]=false;
                                          }
                                        }
                                    });

                                },icon:press[index]==true?Icon(Icons.circle):Icon(Icons.circle_outlined))
                              ],
                            ),
                            separatorBuilder:  (context, index) => const Divider(height: 20,color: Colors.grey,),
                            itemCount: 10),
                      )


                    ])
            )
        )
    );
  }
}
