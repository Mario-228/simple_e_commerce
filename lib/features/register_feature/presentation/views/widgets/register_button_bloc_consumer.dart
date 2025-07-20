import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_e_commerce/core/utils/app_colors/app_colors.dart';
import 'package:simple_e_commerce/core/utils/app_router/app_router.dart';
import 'package:simple_e_commerce/core/widgets/custom_material_button.dart';
import 'package:simple_e_commerce/features/register_feature/presentation/views_models/register_cubit/register_cubit.dart';
import 'package:simple_e_commerce/features/register_feature/presentation/views_models/register_cubit/register_states.dart';

class RegisterButtonBlocConsumer extends StatelessWidget {
  const RegisterButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          GoRouter.of(context).push(AppRouter.login);
        } else if (state is RegisterErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is RegisterLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return CustomMaterialButton(
            text: "Register",
            color: AppColors.orange,
            onPressed: () async {
              if (RegisterCubit.get(context).formKey.currentState!.validate()) {
                await RegisterCubit.get(context).register(context: context);
              }
            },
          );
        }
      },
    );
  }
}
