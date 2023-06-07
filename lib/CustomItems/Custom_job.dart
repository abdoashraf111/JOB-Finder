import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/data_cubit.dart';
import 'custom_icons.dart';


class CustomJob extends StatefulWidget {
   const CustomJob({Key? key, required this.index}) : super(key: key);
   final int index;

  @override
  State<CustomJob> createState() => _CustomJobState();
}

class _CustomJobState extends State<CustomJob> {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<DataCubit,DataState>(builder: (context, state) {

      var modelJob = BlocProvider.of<DataCubit>(context).modelJob;
      var dataModel=modelJob.data![widget.index];
      var jobId=modelJob.data![widget.index].id;
      List likes=BlocProvider.of<DataCubit>(context).likes;

      return Column(
        children: [
          SizedBox(
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
                        Text("${dataModel.name}",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("${dataModel.compName} • United States",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 12)),
                      ],
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    IconButton(
                        onPressed: ()async {

                          if(likes[widget.index]==false){
                           await BlocProvider.of<DataCubit>(context).addFavorites(jobId: jobId!.toInt());

                          }
                          else if (likes[widget.index]==true){
                             BlocProvider.of<DataCubit>(context).showFavorites();
                          var x=BlocProvider.of<DataCubit>(context).getIdToDelete( index: widget.index);
                            await BlocProvider.of<DataCubit>(context).deleteFavorites(jobId:x!.toInt() );

                          }
                        },
                        icon: likes[widget.index] == true
                            ? const Icon(
                          CustomIcons.archive_minus_bold,
                          color: Colors.blue,
                          size: 24,
                        )
                            : const Icon(
                          CustomIcons.archive_minus,
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
                    Container(
                      height: 26,
                      width: 73,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Color.fromRGBO(214, 228, 255, 1),
                      ),
                      child: Center(
                          child: Text("${dataModel.jobTimeType}",
                              style: const TextStyle(
                                  color: Colors.blue, fontSize: 12))),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Container(
                      height: 26,
                      width: 73,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Color.fromRGBO(214, 228, 255, 1),
                      ),
                      child: const Center(
                          child: Text("Remote",
                              style:
                              TextStyle(color: Colors.blue, fontSize: 12))),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Container(
                      height: 26,
                      width: 73,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Color.fromRGBO(214, 228, 255, 1),
                      ),
                      child: Center(
                          child: Text("${dataModel.jobLevel}",
                              style: const TextStyle(
                                  color: Colors.blue, fontSize: 12))),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text("\$ ${dataModel.salary}",
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
          ),
          const Divider(
            color: Colors.grey,
          )
        ],
      );
    },);
  }
}
