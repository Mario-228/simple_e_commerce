import 'package:flutter/material.dart';
import 'package:simple_e_commerce/features/cart_feature/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CartViewBody());
  }
}
