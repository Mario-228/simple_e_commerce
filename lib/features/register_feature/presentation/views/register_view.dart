import 'package:flutter/material.dart';
import 'package:simple_e_commerce/features/register_feature/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: RegisterViewBody(),
      ),
    );
  }
}
