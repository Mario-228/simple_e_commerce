import 'package:flutter/material.dart';
import 'package:simple_e_commerce/core/utils/app_router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      routerConfig: AppRouter.routers,
    );
  }
}
