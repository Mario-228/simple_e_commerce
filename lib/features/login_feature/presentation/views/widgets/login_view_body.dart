import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_e_commerce/core/utils/app_colors/app_colors.dart';
import 'package:simple_e_commerce/core/utils/app_fonts/app_fonts.dart';
import 'package:simple_e_commerce/core/utils/app_router/app_router.dart';
import 'package:simple_e_commerce/core/widgets/custom_material_button.dart';
import 'package:simple_e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:simple_e_commerce/features/login_feature/presentation/views/widgets/login_button_bloc_consumer.dart';
import 'package:simple_e_commerce/features/login_feature/presentation/views_models/login_cubit/login_cubit.dart';
import 'package:simple_e_commerce/features/login_feature/presentation/views_models/login_cubit/login_states.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: LoginCubit.get(context).formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome', style: AppFonts.textStyleBold28),
            SizedBox(height: 10),
            Text(
              'Please Login to continue',
              style: AppFonts.textStyleRegular15,
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              type: TextInputType.emailAddress,
              labelText: 'Email',
              controller: LoginCubit.get(context).emailController,
              validator:
                  (value) =>
                      (value == null || value.isEmpty)
                          ? 'Email is required'
                          : null,
            ),
            SizedBox(height: 20),
            BlocBuilder<LoginCubit, LoginStates>(
              builder: (context, state) {
                return CustomTextFormField(
                  isPassword: LoginCubit.get(context).isVisible,
                  onPressed:
                      () => LoginCubit.get(context).changeLoginVisibility(),
                  icon: LoginCubit.get(context).eye,
                  type: TextInputType.visiblePassword,
                  labelText: 'Password',
                  controller: LoginCubit.get(context).passwordController,
                  validator:
                      (value) =>
                          (value == null || value.isEmpty)
                              ? 'Password is required'
                              : null,
                );
              },
            ),
            SizedBox(height: 20),
            LoginButtonBlocConsumer(),
            SizedBox(height: 20),
            CustomMaterialButton(
              text: "Register",
              color: AppColors.white,
              textColor: AppColors.black,
              onPressed: () => GoRouter.of(context).push(AppRouter.register),
            ),
            SizedBox(height: 20),
            CustomMaterialButton(
              text: "Continue as Guest",
              color: AppColors.white,
              textColor: AppColors.black,
              onPressed:
                  () => GoRouter.of(context).pushReplacement(AppRouter.home),
            ),
          ],
        ),
      ),
    );
  }
}
