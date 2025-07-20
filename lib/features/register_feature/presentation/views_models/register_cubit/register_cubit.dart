import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_e_commerce/core/utils/firebase_service/firebase_service.dart';
import 'package:simple_e_commerce/features/register_feature/presentation/views_models/register_cubit/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> register({required BuildContext context}) async {
    emit(RegisterLoadingState());
    try {
      final user = await FirebaseService().register(
        context: context,
        email: emailController.text,
        password: passwordController.text,
      );
      if (user != null) {
        emit(RegisterSuccessState(user: user));
      } else {
        emit(
          RegisterErrorState(error: 'Registration failed. Please try again.'),
        );
      }
    } catch (e) {
      emit(RegisterErrorState(error: 'An error occurred: ${e.toString()}'));
    }
  }

  bool isVisible = true;
  IconData eye = Icons.visibility_off;
  void changeVisibility() {
    isVisible = !isVisible;
    if (isVisible) {
      eye = Icons.visibility_off;
    } else {
      eye = Icons.visibility;
    }
    emit(ChangePasswordVisibilityState());
  }
}
