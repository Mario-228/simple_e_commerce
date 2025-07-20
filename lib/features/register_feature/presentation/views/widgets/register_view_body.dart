import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_e_commerce/core/utils/app_colors/app_colors.dart';
import 'package:simple_e_commerce/core/utils/app_fonts/app_fonts.dart';
import 'package:simple_e_commerce/core/utils/app_router/app_router.dart';
import 'package:simple_e_commerce/core/widgets/custom_material_button.dart';
import 'package:simple_e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:simple_e_commerce/features/register_feature/presentation/views/widgets/register_button_bloc_consumer.dart';
import 'package:simple_e_commerce/features/register_feature/presentation/views_models/register_cubit/register_cubit.dart';
import 'package:simple_e_commerce/features/register_feature/presentation/views_models/register_cubit/register_states.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: RegisterCubit.get(context).formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome', style: AppFonts.textStyleBold28),
            SizedBox(height: 10),
            Text(
              'Please Register to continue',
              style: AppFonts.textStyleRegular15,
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              type: TextInputType.emailAddress,
              labelText: 'Email',
              controller: RegisterCubit.get(context).emailController,
              validator:
                  (value) =>
                      (value == null || value.isEmpty)
                          ? 'Email is required'
                          : null,
            ),
            SizedBox(height: 20),
            BlocBuilder<RegisterCubit, RegisterStates>(
              builder: (context, state) {
                return CustomTextFormField(
                  icon: RegisterCubit.get(context).eye,
                  isPassword: RegisterCubit.get(context).isVisible,
                  onPressed:
                      () => RegisterCubit.get(context).changeVisibility(),
                  type: TextInputType.visiblePassword,
                  labelText: 'Password',
                  controller: RegisterCubit.get(context).passwordController,
                  validator:
                      (value) =>
                          (value == null || value.isEmpty)
                              ? 'Password is required'
                              : null,
                );
              },
            ),
            SizedBox(height: 20),
            RegisterButtonBlocConsumer(),
            SizedBox(height: 20),
            CustomMaterialButton(
              text: "Return to Login",
              color: AppColors.white,
              textColor: AppColors.black,
              onPressed: () => GoRouter.of(context).push(AppRouter.login),
            ),
          ],
        ),
      ),
    );
  }
}
