import 'package:flutter/material.dart';
import '../../../../../core/utils/get_it_service/variables_locator_service.dart';
import '../../../../../core/utils/product_model_with_quantity/product_model_with_quantity.dart';

class CustomCartItemProduct extends StatelessWidget {
  const CustomCartItemProduct({super.key, required this.item});
  final ProductModelWithQuantity item;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Image.network(
          item.product.images[0],
          width: 60,
          fit: BoxFit.cover,
        ),
        title: Text(item.product.title),
        subtitle: Text('\$${item.product.price * item.quantity}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                VariablesLocatorService.cartCubit.changeQuantity(
                  product: item,
                  newQuantity: item.quantity - 1,
                );
              },
            ),
            Text(item.quantity.toString()),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                VariablesLocatorService.cartCubit.changeQuantity(
                  product: item,
                  newQuantity: item.quantity + 1,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                VariablesLocatorService.cartCubit.removeFromCart(item);
              },
            ),
          ],
        ),
      ),
    );
  }
}
