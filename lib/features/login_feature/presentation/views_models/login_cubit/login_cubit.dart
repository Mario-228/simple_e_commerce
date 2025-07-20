import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_e_commerce/core/utils/firebase_service/firebase_service.dart';
import 'package:simple_e_commerce/features/login_feature/presentation/views_models/login_cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> login(BuildContext context) async {
    emit(LoginLoadingState());

    try {
      final user = await FirebaseService().login(
        context: context,
        email: emailController.text,
        password: passwordController.text,
      );

      if (user != null) {
        emit(LoginSuccessState(user: user));
      } else {
        emit(
          LoginErrorState(
            error: 'Login failed. Please check your credentials.',
          ),
        );
      }
    } catch (e) {
      emit(LoginErrorState(error: 'An error occurred: ${e.toString()}'));
    }
  }

  bool isVisible = true;
  IconData eye = Icons.visibility_off;
  void changeLoginVisibility() {
    isVisible = !isVisible;
    if (isVisible) {
      eye = Icons.visibility_off;
    } else {
      eye = Icons.visibility;
    }
    emit(ChangePasswordVisibilityState());
  }
}
