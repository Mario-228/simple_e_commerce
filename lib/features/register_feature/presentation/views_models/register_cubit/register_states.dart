import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterStates {}

class RegisterInitial extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final User user;
  RegisterSuccessState({required this.user});
}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState({required this.error});
}
