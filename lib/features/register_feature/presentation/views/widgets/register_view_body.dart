import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_e_commerce/core/utils/app_colors/app_colors.dart';
import 'package:simple_e_commerce/core/utils/app_fonts/app_fonts.dart';
import 'package:simple_e_commerce/core/utils/app_router/app_router.dart';
import 'package:simple_e_commerce/core/widgets/custom_material_button.dart';
import 'package:simple_e_commerce/core/widgets/custom_text_form_field.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
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
            controller: TextEditingController(),
            validator:
                (value) =>
                    (value == null || value.isEmpty)
                        ? 'Email is required'
                        : null,
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            type: TextInputType.visiblePassword,
            labelText: 'Password',
            controller: TextEditingController(),
            validator:
                (value) =>
                    (value == null || value.isEmpty)
                        ? 'Password is required'
                        : null,
          ),
          SizedBox(height: 20),
          CustomMaterialButton(
            text: "Register",
            color: AppColors.orange,
            onPressed: () {},
          ),
          SizedBox(height: 20),
          CustomMaterialButton(
            text: "Return to Login",
            color: AppColors.white,
            textColor: AppColors.black,
            onPressed: () => GoRouter.of(context).push(AppRouter.login),
          ),
        ],
      ),
    );
  }
}
