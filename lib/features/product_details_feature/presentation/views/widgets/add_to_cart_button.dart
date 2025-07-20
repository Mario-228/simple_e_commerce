import 'package:flutter/material.dart';
import 'package:simple_e_commerce/core/utils/app_colors/app_colors.dart';
import 'package:simple_e_commerce/core/utils/variables_locator_service/variables_locator_service.dart';
import 'package:simple_e_commerce/core/widgets/custom_material_button.dart';
import 'package:simple_e_commerce/features/product_details_feature/presentation/views/widgets/product_details_view_body.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/utils/product_model_with_quantity/product_model_with_quantity.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.quantity,
    required this.widget,
  });

  final int quantity;
  final ProductDetailsViewBody widget;

  @override
  Widget build(BuildContext context) {
    return CustomMaterialButton(
      text: "Add to Cart",
      onPressed: () {
        if (quantity == 0) {
          showSnackBar(context, "Please select quantity");
        } else {
          VariablesLocatorService.cartCubit.addToCart(
            ProductModelWithQuantity(
              product: widget.product,
              quantity: quantity,
            ),
          );
          showSnackBar(
            context,
            "Added ${widget.product.title} (x$quantity) to cart",
          );
        }
      },
      color: AppColors.orange,
    );
  }
}
