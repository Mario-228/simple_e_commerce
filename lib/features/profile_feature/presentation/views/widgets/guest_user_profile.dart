import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router/app_router.dart';

class GuestUserProfile extends StatelessWidget {
  const GuestUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Logged in as Guest"),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => GoRouter.of(context).push(AppRouter.login),
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}
