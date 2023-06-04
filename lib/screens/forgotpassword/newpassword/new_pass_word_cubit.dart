import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_pass_word_state.dart';

class NewPassWordCubit extends Cubit<NewPassWordState> {
  NewPassWordCubit() : super(NewPassWordInitial());
  bool showPass1=false;
  bool showPass2=false;
  showPassFun1(){
    showPass1=!showPass1;
    emit(NewPassWordShow1());
  }
  showPassFun2(){
    showPass2=!showPass2;
    emit(NewPassWordShow2());
  }
}
