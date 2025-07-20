import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_e_commerce/core/utils/app_router/app_router.dart';
import 'package:simple_e_commerce/features/profile_feature/presentation/views/widgets/profile_view_body.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';

class UserWithCredentialsProfile extends StatelessWidget {
  const UserWithCredentialsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Logged in as:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Text(
            ProfileViewBody.user!.email ?? "No Email",
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (context.mounted) {
                showSnackBar(context, "Logged out successfully");
                GoRouter.of(context).pushReplacement(AppRouter.login);
              }
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
