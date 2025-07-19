import 'package:flutter/material.dart';
import 'package:simple_e_commerce/features/login_feature/presentation/views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const LoginView(),
    );
  }
}
