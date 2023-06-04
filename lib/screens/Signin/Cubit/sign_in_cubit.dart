import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../Services/sharedprefeances.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  bool clickEnable = true;
  bool checkBox = false ;
  bool showPass = false;

  trueClickEnable(){
    clickEnable=true;
    emit(SignInActiveButton());
  }

  falseClickEnable(){
    clickEnable=false;
    emit(SignInActiveButton());
  }

  checkBoxTrue(){
    checkBox=true;
    MyCache.SetBool(
        key: MyChachKey.checked,
        value: checkBox);
    emit(SignInCheckBox());
    print("true");
  }

  checkBoxFalse(){
    checkBox=false;
    MyCache.SetBool(
        key: MyChachKey.checked,
        value: checkBox);
    emit(SignInCheckBox());
    print("false");
  }

  showPassFun(){
    showPass = !showPass;
    emit(SignInShowPass());
  }

  saveData({required String password,required String name,required String email}){
    MyCache.SetString(
        key: MyChachKey.password,
        value: password);
    MyCache.SetString(
        key: MyChachKey.name,
        value: name);
    MyCache.SetString(
        key: MyChachKey.email,
        value: email);
  }
  // sharePref(){
  //   checkBox = MyCache.GetBool(key: MyChachKey.checked)!;
  // }

}
