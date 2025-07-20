import 'package:simple_e_commerce/core/utils/cart_cubit/cart_cubit.dart';
import 'package:simple_e_commerce/features/product_feature/presentation/views_models/get_product_cubit/get_product_cubit.dart';

abstract class VariablesLocatorService {
  static final GetProductCubit getProductCubit =
      GetProductCubit()..getProduct();
  static final CartCubit cartCubit = CartCubit();
}
