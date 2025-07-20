import 'package:dartz/dartz.dart';
import 'package:simple_e_commerce/core/errors/errors.dart';
import 'package:simple_e_commerce/features/product_feature/data/models/product_model.dart';

abstract class ProductRepo {
  Future<Either<Errors, List<ProductModel>>> getProducts();
}
