import 'package:simple_e_commerce/features/product_feature/data/models/product_model.dart';

abstract class GetProductStates {}

class GetProductInitialState extends GetProductStates {}

class GetProductLoadingState extends GetProductStates {}

class GetProductSuccessState extends GetProductStates {
  final List<ProductModel> products;
  GetProductSuccessState({required this.products});
}

class GetProductErrorState extends GetProductStates {
  final String errorMessage;
  GetProductErrorState({required this.errorMessage});
}
