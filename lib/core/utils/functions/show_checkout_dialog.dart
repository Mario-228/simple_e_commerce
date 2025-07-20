import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_e_commerce/core/utils/app_router/app_router.dart';
import 'package:simple_e_commerce/core/utils/functions/show_snack_bar.dart';
import 'package:simple_e_commerce/features/profile_feature/presentation/views/widgets/profile_view_body.dart';

void showCheckoutDialog(BuildContext context) {
  if (ProfileViewBody.isGuest) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Sign In Required'),
            content: const Text('You need to sign in before checking out.'),
            actions: [
              TextButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                  GoRouter.of(context).push(AppRouter.login);
                },
                child: const Text('Sign In'),
              ),
            ],
          ),
    );
  } else {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirm Checkout'),
            content: Text(
              'Proceed with checkout using ${ProfileViewBody.user?.email}?',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                  showSnackBar(context, "Checked out successfully");
                },
                child: const Text('Confirm'),
              ),
            ],
          ),
    );
  }
}
