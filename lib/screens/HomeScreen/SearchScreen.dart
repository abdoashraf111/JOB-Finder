import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../CustomItems/custom_icons.dart';
import '../../controller/data_cubit.dart';
import '../JobDetails/job_Details.dart';
import 'HomeNavigationBar.dart';

class SearchScreen extends StatefulWidget {
   SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller =TextEditingController();

List searchHistory=[];
List filterList=[];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataCubit,DataState>(builder:(context, state) {
      List mainList=BlocProvider.of<DataCubit>(context).nameList;
      // List filter=mainList.where((element) => element.contains(_controller.text),).toList();
      // filterList=mainList;
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:24 ,right: 24,top: 40),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) =>HomeNavigationBar(pageNumber: 0) ,));
                      },
                          icon: const Icon(Icons.arrow_back,color: Colors.black,)),
                      Expanded(
                        child: TextFormField(
                          onFieldSubmitted: (value) {
                            setState(() {
                              searchHistory.add(value);
                              print(value);
                            });
                          },
                          onChanged: (value){

                            if(value.isEmpty)
                            {
                              setState(() {
                                filterList=mainList;
                              });
                            }
                            else{
                              setState(() {
                                filterList=mainList.where((element) => element.contains(value),).toList();
                              });
                            }
                            print(filterList);
                          },
                          controller:_controller ,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(CustomIcons.search_normal),
                            hintText: "Search....",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22,),
                Visibility(
                  visible:searchHistory.isEmpty?false:true,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 36,
                    color: Color(0xffE5E7EB),
                    child:const Padding(
                      padding: EdgeInsets.only(right:24 ,left: 24,),
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Recent searches"),
                        ],
                      ),
                    ) ,
                  ),
                ),
                SizedBox(
                  height: searchHistory.length.toDouble()*60,
                  child: ListView.separated(
                    // key: BlocProvider.of<a>(context).,
                      itemBuilder: (context, index) => InkWell(
                          onTap: (){
                            setState(() {
                              _controller.text=searchHistory[index];
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 24,left: 24),
                            child: Row(children: [
                              const Icon(Icons.access_time_outlined,size: 16,),
                              const SizedBox(width: 10,),
                              Text(searchHistory[index]),
                              const Spacer(),
                              IconButton(onPressed: (){
                                setState(() {
                                  searchHistory.remove(searchHistory[index]);
                                });
                              }, icon: Icon(CustomIcons.close_circle))
                            ],),
                          )),
                      separatorBuilder: (context, index) => const Column(
                        children: [
                          SizedBox(height: 2,),
                          Divider(height: 10,color: Colors.grey,)
                        ],
                      ),
                      itemCount: searchHistory.length),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 36,
                  color: Color(0xffE5E7EB),
                  child:const Padding(
                    padding: EdgeInsets.only(right:24 ,left: 24,),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Popular searches"),
                      ],
                    ),
                  ) ,
                ),
                SizedBox(
                  height: filterList.length.toDouble()*60,
                  child: ListView.separated(
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 24,left: 24),
                        child: Row(children: [
                          Icon(CustomIcons.search_status,size: 16,),
                          SizedBox(width: 10,),
                          Text(filterList[index]),
                          Spacer(),
                          IconButton(onPressed: (){
                            int Indexx=mainList.indexOf(filterList[index]);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>JobDetails(index: Indexx)));
                          }, icon: Icon(CustomIcons.arrow_right,color: Colors.blue,))
                        ],),
                      ),
                      separatorBuilder: (context, index) => const Column(
                        children: [
                          SizedBox(height: 2,),
                          Divider(height: 10,color: Colors.grey,)
                        ],
                      ),
                      itemCount: filterList.length),
                ),

              ],
            ),
          ),
        ),
      );
    },);

  }
}
