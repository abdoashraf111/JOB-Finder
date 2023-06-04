part of 'sign_in_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}
class SignInActiveButton extends SignInState {}
class SignInCheckBox extends SignInState {}
class SignInShowPass extends SignInState {}
// class SignInShowPass extends SignInState {}
