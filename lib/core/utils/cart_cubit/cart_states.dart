import 'package:simple_e_commerce/core/utils/product_model_with_quantity/product_model_with_quantity.dart';

abstract class CartStates {}

class CartInitial extends CartStates {}

class CartSuccess extends CartStates {
  final List<ProductModelWithQuantity> cartItems;
  CartSuccess(this.cartItems);
}
