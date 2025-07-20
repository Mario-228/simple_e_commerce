import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_e_commerce/core/utils/app_router/app_router.dart';
import 'package:simple_e_commerce/core/utils/functions/show_snack_bar.dart';
import 'package:simple_e_commerce/core/utils/get_it_service/variables_locator_service.dart';
import 'package:simple_e_commerce/core/utils/product_model_with_quantity/product_model_with_quantity.dart';
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
        trailing: BlocProvider.value(
          value: VariablesLocatorService.cartCubit,
          child: ElevatedButton(
            child: Text('Add to Cart'),
            onPressed: () {
              VariablesLocatorService.cartCubit.addToCart(
                ProductModelWithQuantity(product: productModel),
              );
              showSnackBar(context, "Product added to cart");
            },
          ),
        ),
        onTap:
            () => GoRouter.of(
              context,
            ).push(AppRouter.productDetails, extra: productModel),
      ),
    );
  }
}
