import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../controller/data_cubit.dart';
import '../screens/JobDetails/job_Details.dart';
import 'custom_icons.dart';
class CustomFavJob extends StatelessWidget {
   CustomFavJob({Key? key,required this.index}) : super(key: key);
  var click=0;
  int index;
  @override
  Widget build(BuildContext context) {

    var favMode=BlocProvider.of<DataCubit>(context).showFavModel;
    return BlocBuilder<DataCubit,DataState>(builder: (context, state) {
      return SizedBox(
        height: 103,
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Row(
              children: [
                Image.asset("lib/images/Zoom Logo.png"),
                const SizedBox(
                  width: 16,
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(favMode.data![index].name.toString(),
                        style: const TextStyle(
                            color: Colors.black, fontSize: 18)),
                    const SizedBox(
                      height: 4,
                    ),
                     Text("${favMode.data![index].id.toString()} • United States",
                        style: const TextStyle(
                            color: Colors.black, fontSize: 12)),
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
                IconButton(
                    onPressed: ()async {
                      showBottomSheet(context: context,
                        builder: (context) =>
                            Container(
                              height: 230,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                                  border: Border.all(color: Colors.grey)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 24,left: 24),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10,),
                                    const SizedBox(
                                        width: 100,
                                        child: Divider(height: 10,color: Colors.black,thickness: 2,)),
                                    const SizedBox(height: 10,),
                                    InkWell(
                                      onTap: (){
                                        Navigator.pop(context);
                                        BlocProvider.of<DataCubit>(context).showFavorites();
                                       int ind=BlocProvider.of<DataCubit>(context).getIndex(index: index)!.toInt();
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => JobDetails(index: ind)));
                                      },
                                      child: Container(height: 50,decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          border: Border.all(color: Colors.grey)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(15),
                                          child: Row(children: [Icon(CustomIcons.directbox_default_2),
                                            SizedBox(width: 20,),
                                            Text("Apply Job"),
                                            Spacer(),
                                            Icon(Icons.arrow_forward_ios_outlined)
                                          ]),
                                        ),),
                                    ),
                                    const SizedBox(height: 10,),
                                    InkWell(
                                      onTap: (){},
                                      child: Container(height: 50,decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          border: Border.all(color: Colors.grey)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(15),
                                          child: Row(children: [Icon(CustomIcons.export_icon),
                                            SizedBox(width: 20,),
                                            Text("Share via..."),
                                            Spacer(),
                                            Icon(Icons.arrow_forward_ios_outlined)
                                          ]),
                                        ),),
                                    ),
                                    const SizedBox(height: 10,),
                                    InkWell(
                                      onTap: ()async{
                                        Navigator.pop(context);
                                        var x=BlocProvider.of<DataCubit>(context).showFavModel.data![index].id;
                                        await BlocProvider.of<DataCubit>(context).deleteFavorites(jobId:x!.toInt() );
                                      },
                                      child: Container(height: 50,decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          border: Border.all(color: Colors.grey)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(15),
                                          child: Row(children: [Icon(CustomIcons.archive_minus),
                                            SizedBox(width: 20,),
                                            Text("Cancel save"),
                                            Spacer(),
                                            Icon(Icons.arrow_forward_ios_outlined)
                                          ]),
                                        ),),
                                    ),
                                    const SizedBox(height: 10,),
                                  ],
                                ),
                              ),
                            )
                        ,);

                    },
                    icon: const Icon(
                      CustomIcons.more,
                      color: Colors.black,
                      size: 24,
                    )),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              children: [
               Text(favMode.data![index].createdAt.toString()),
                Spacer(),
                Text(" salary",
                    style:
                    const TextStyle(color: Colors.green, fontSize: 16)),
                const Text("/Month",
                    style: TextStyle(color: Colors.black, fontSize: 12)),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      );
    },);

  }
}
