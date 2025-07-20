import 'package:dartz/dartz.dart';
import 'package:simple_e_commerce/core/errors/errors.dart';
import 'package:simple_e_commerce/core/utils/api_service/api_service.dart';
import 'package:simple_e_commerce/core/utils/api_service/base_url.dart';
import 'package:simple_e_commerce/features/product_feature/data/models/product_model.dart';
import 'package:simple_e_commerce/features/product_feature/data/repos/product_end_points.dart';
import 'package:simple_e_commerce/features/product_feature/data/repos/product_repo.dart';

class ProductRepoImplementation implements ProductRepo {
  @override
  Future<Either<Errors, List<ProductModel>>> getProducts() async {
    try {
      var response = await ApiService(
        dioHelper: BaseUrl.products,
      ).get(ProductEndPoints.products);
      List<ProductModel> products = [];
      for (var element in response['products']) {
        products.add(ProductModel.fromJson(element));
      }
      return right(products);
    } on Exception catch (e) {
      return left(ServerError.fromDioError(e));
    }
  }
}
