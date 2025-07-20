import 'package:flutter/material.dart';
import 'package:simple_e_commerce/core/utils/functions/show_snack_bar.dart';
import 'package:simple_e_commerce/features/product_feature/data/models/product_model.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          productModel.images[0],
          width: 60.0,
          height: 60.0,
          fit: BoxFit.cover,
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(productModel.title),
          ),
        ),
        subtitle: Text('${productModel.price}\$'),
        trailing: ElevatedButton(
          child: Text('Add to Cart'),
          onPressed: () {
            showSnackBar(context, "Product added to cart");
          },
        ),
        onTap: () {},
      ),
    );
  }
}
