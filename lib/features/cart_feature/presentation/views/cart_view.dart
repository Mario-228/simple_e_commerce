import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_e_commerce/core/utils/variables_locator_service/variables_locator_service.dart';
import 'package:simple_e_commerce/features/cart_feature/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: VariablesLocatorService.cartCubit,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: const CartViewBody(),
        ),
      ),
    );
  }
}
