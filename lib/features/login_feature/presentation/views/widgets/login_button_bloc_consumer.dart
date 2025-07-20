import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_e_commerce/core/utils/app_colors/app_colors.dart';
import 'package:simple_e_commerce/core/utils/app_router/app_router.dart';
import 'package:simple_e_commerce/core/utils/functions/show_snack_bar.dart';
import 'package:simple_e_commerce/features/login_feature/presentation/views_models/login_cubit/login_cubit.dart';

import '../../../../../core/widgets/custom_material_button.dart';
import '../../views_models/login_cubit/login_states.dart';

class LoginButtonBlocConsumer extends StatelessWidget {
  const LoginButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          GoRouter.of(context).pushReplacement(AppRouter.home);
        } else if (state is LoginErrorState) {
          showSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return CustomMaterialButton(
            text: "Login",
            color: AppColors.orange,
            onPressed: () async {
              if (LoginCubit.get(context).formKey.currentState!.validate()) {
                await LoginCubit.get(context).login(context);
              }
            },
          );
        }
      },
    );
  }
}
