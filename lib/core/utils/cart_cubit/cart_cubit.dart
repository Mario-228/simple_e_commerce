import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_e_commerce/core/utils/cart_cubit/cart_states.dart';
import 'package:simple_e_commerce/core/utils/product_model_with_quantity/product_model_with_quantity.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitial());

  static CartCubit get(BuildContext context) => BlocProvider.of(context);

  List<ProductModelWithQuantity> cartItems = [];

  void addToCart(ProductModelWithQuantity product) {
    final index = cartItems.indexWhere(
      (item) => item.product.id == product.product.id,
    );

    if (index != -1) {
      cartItems[index].quantity += product.quantity;
    } else {
      cartItems.add(product);
    }

    emit(CartSuccess(cartItems));
  }

  void removeFromCart(ProductModelWithQuantity product) {
    cartItems.removeWhere((item) => item.product.id == product.product.id);
    emit(CartSuccess(cartItems));
  }

  void clearCart() {
    cartItems.clear();
    emit(CartSuccess([]));
  }

  void changeQuantity({
    required ProductModelWithQuantity product,
    required int newQuantity,
  }) {
    final index = cartItems.indexWhere(
      (item) => item.product.id == product.product.id,
    );
    if (index != -1) {
      if (newQuantity <= 0) {
        removeFromCart(product);
      } else {
        cartItems[index].quantity = newQuantity;
        emit(CartSuccess(cartItems));
      }
    }
  }

  double getTotal() {
    return cartItems.fold(0.0, (total, item) {
      return total + (item.product.price * item.quantity);
    });
  }
}
