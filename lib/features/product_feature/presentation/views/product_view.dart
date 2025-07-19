import 'package:flutter/material.dart';
import 'package:simple_e_commerce/features/product_feature/presentation/views/widgets/product_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: ProductViewBody(),
      ),
    );
  }
}
