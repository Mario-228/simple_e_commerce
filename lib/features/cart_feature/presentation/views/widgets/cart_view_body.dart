import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_e_commerce/core/utils/app_colors/app_colors.dart';
import 'package:simple_e_commerce/core/utils/app_fonts/app_fonts.dart';
import 'package:simple_e_commerce/core/utils/cart_cubit/cart_cubit.dart';
import 'package:simple_e_commerce/core/utils/cart_cubit/cart_states.dart';
import 'package:simple_e_commerce/core/utils/get_it_service/variables_locator_service.dart';
import 'package:simple_e_commerce/core/widgets/custom_material_button.dart';
import 'package:simple_e_commerce/features/cart_feature/presentation/views/widgets/custom_cart_item_product.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        var cartItems = VariablesLocatorService.cartCubit.cartItems;
        if (cartItems.isEmpty) {
          return const Center(child: Text("Cart is empty"));
        }
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder:
                    (context, index) =>
                        CustomCartItemProduct(item: cartItems[index]),
                separatorBuilder:
                    (context, index) => const SizedBox(height: 10.0),
                itemCount: cartItems.length,
              ),
            ),
            Text(
              "Total: ${VariablesLocatorService.cartCubit.getTotal().toStringAsFixed(2)} \$",
              style: AppFonts.textStyleBold20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomMaterialButton(
                    text: "Checkout",
                    color: AppColors.orange,
                    textColor: AppColors.white,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: CustomMaterialButton(
                    text: "Delete Cart",
                    color: AppColors.orange,
                    textColor: AppColors.white,
                    onPressed:
                        () => VariablesLocatorService.cartCubit.clearCart(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        );
      },
    );
  }
}
