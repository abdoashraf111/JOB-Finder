import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../CustomItems/Custom_job.dart';
import '../CustomItems/custom_icons.dart';
import '../controller/data_cubit.dart';
import '../screens/job_Details.dart';

class search extends SearchDelegate{
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(onPressed: (){
        query="";
      }, icon: const Icon(CustomIcons.close_circle,color: Colors.black,))
    ];

  }

  @override
  Widget? buildLeading(BuildContext context) {

   return IconButton(onPressed: (){
     close(context, null);
   }, icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {

    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List mainList=BlocProvider.of<DataCubit>(context).nameList;
    List filter=mainList.where((element) => element.contains(query),).toList();

       // Index=mainList.indexOf(filter[0]);

    return Padding(
      padding: const EdgeInsets.only(right: 24,left: 24),
      child: ListView.builder(
          itemBuilder: (context, index) => query==""?
          Row(children: [
            Icon(Icons.access_alarm),
            Text(mainList[index]),
            Spacer(),
            IconButton(icon: Icon(CustomIcons.arrow_right),onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => JobDetails(index: index),));
            },)
          ],)
              :InkWell(
              onTap: (){
               int Index=mainList.indexOf(filter[index]);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => JobDetails(index: Index),));
              },
              child: CustomJob(index: mainList.indexOf(filter[index]),)),
          itemCount: query==""?mainList.length:filter.length),
    );
  }

}
