import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_e_commerce/core/utils/app_router/app_router.dart';
import 'package:simple_e_commerce/core/utils/functions/show_snack_bar.dart';
import 'package:simple_e_commerce/core/utils/variables_locator_service/variables_locator_service.dart';

void showCheckoutDialog(BuildContext context) {
  if (FirebaseAuth.instance.currentUser == null) {
    showDialog(
      context: context,
      builder:
          (context) => BlocProvider.value(
            value: VariablesLocatorService.cartCubit,
            child: AlertDialog(
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
          ),
    );
  } else {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirm Checkout'),
            content: Text(
              'Proceed with checkout using ${FirebaseAuth.instance.currentUser?.email}?',
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
                  VariablesLocatorService.cartCubit.clearCart();
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
