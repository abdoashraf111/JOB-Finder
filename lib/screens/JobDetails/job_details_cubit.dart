import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'job_details_state.dart';

class JobDetailsCubit extends Cubit<JobDetailsState> {
  JobDetailsCubit() : super(JobDetailsInitial());
  // int groupValue=0;
  // groupchange(int value){
  //       groupValue=value;
  //       emit(JobDetailsGroupValue());}
  //


}
