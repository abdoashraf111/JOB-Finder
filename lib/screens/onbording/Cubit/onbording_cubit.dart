import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'onbording_state.dart';

class OnbordingCubit extends Cubit<OnbordingState> {
  OnbordingCubit() : super(OnbordingInitial());
  int numPage = 0;
   changePage({required value}){
    numPage=value;
    emit(OnbordingScroll());

  }
}
