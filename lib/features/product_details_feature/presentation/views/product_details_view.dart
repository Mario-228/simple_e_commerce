import 'package:flutter/material.dart';
import 'package:simple_e_commerce/core/utils/app_fonts/app_fonts.dart';
import 'package:simple_e_commerce/features/product_details_feature/presentation/views/widgets/product_details_view_body.dart';
import 'package:simple_e_commerce/features/product_feature/data/models/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productModel.title, style: AppFonts.textStyleBold16),
        centerTitle: true,
      ),
      body: ProductDetailsViewBody(product: productModel),
    );
  }
}
