import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'custom_card_state.dart';

class CustomCardCubit extends Cubit<CustomCardState> {
  CustomCardCubit() : super(CustomCardInitial());
  bool onTap = false;
  onTapFun(){
    onTap = !onTap;
    emit(CustomCardOnTap());
  }
}
