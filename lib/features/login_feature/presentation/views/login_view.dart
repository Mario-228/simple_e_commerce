import 'package:flutter/material.dart';
import 'package:simple_e_commerce/features/login_feature/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login View'), centerTitle: true),
      body: LoginViewBody(),
    );
  }
}
