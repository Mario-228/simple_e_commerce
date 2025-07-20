import 'package:simple_e_commerce/features/product_feature/data/models/product_model.dart';

class ProductModelWithQuantity {
  final ProductModel product;
  int quantity;

  ProductModelWithQuantity({required this.product, this.quantity = 1});
}
