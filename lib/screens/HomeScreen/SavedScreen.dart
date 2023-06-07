import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../CustomItems/CustomfavJob.dart';
import '../../controller/data_cubit.dart';
import 'HomeNavigationBar.dart';

class SavedScreen extends StatelessWidget {
    SavedScreen({Key? key}) : super(key: key);
    int numb=0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataCubit,DataState>(
        listener:(context, state)  async {
          if(state is DataDeleteFavorites){
            await BlocProvider.of<DataCubit>(context).showFavorites();
          }
        } ,
        builder: (context, state) {
       numb =BlocProvider.of<DataCubit>(context).showFavModel.data!.length;

         return SafeArea(
         child: SingleChildScrollView(
           child: Column(
             children: [
               const SizedBox(
                 height: 20,
               ),
               Padding(
                 padding: const EdgeInsets.only(right: 24, left: 24),
                 child: Row(
                   children: [
                     IconButton(
                       icon: const Icon(Icons.arrow_back),
                       onPressed: () {
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeNavigationBar(pageNumber: 0),));
                       },
                     ),
                     const Spacer(flex: 3,),
                     const Text("Saved"),
                     const Spacer(flex: 4,),
                   ],
                 ),
               ),
               const SizedBox(
                 height: 20,
               ),
               Container(
                 width: MediaQuery.of(context).size.width,
                 height: 36,
                 color: const Color(0xffE5E7EB),
                 child:  Padding(
                   padding: const EdgeInsets.only(right:24 ,left: 24,),
                   child: Row(mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("$numb Job Saved"),
                     ],
                   ),
                 ) ,
               ),
               numb==0? SizedBox(
                 height: 600,
                 width: MediaQuery.of(context).size.width,
                 child: Column(
                   children: [
                     const Spacer(),
                     Image.asset("lib/images/Saved Ilustration.png"),
                     const Text("Nothing has been saved yet"),
                     const Text("Press the star icon on the job you want to save."),
                     const Spacer(),
                   ],
                 ),
               )
                   : SizedBox(
                 height: 600,
                 width: MediaQuery.of(context).size.width,
                 child: ListView.separated(
                     itemBuilder: (context, index) => Padding(
                       padding: const EdgeInsets.only(right: 24,left: 24),
                       child: CustomFavJob(index: index,),
                     ),
                     separatorBuilder: (context, index) => const Column(
                       children: [
                         SizedBox(height: 10,),
                         Divider(height: 20,color: Colors.grey,),
                       ],
                     ),

                     itemCount: numb),
               )
             ],
           ),
         ),
       );
      // else{return Center(child: CircularProgressIndicator(),);}
    });
  }
}
