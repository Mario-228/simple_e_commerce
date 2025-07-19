import 'package:flutter/material.dart';
import 'package:simple_e_commerce/features/product_feature/presentation/views/widgets/custom_product_item.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: 15,
      separatorBuilder: (context, index) => const SizedBox(height: 10.0),
      itemBuilder: (context, index) => CustomProductItem(),
    );
  }
}
