import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_e_commerce/features/product_feature/data/models/product_model.dart';
import 'package:simple_e_commerce/features/product_feature/data/repos/product_repo_implementation.dart';
import 'package:simple_e_commerce/features/product_feature/presentation/views_models/get_product_cubit/get_product_states.dart';

class GetProductCubit extends Cubit<GetProductStates> {
  GetProductCubit() : super(GetProductInitialState());

  static GetProductCubit get(BuildContext context) => BlocProvider.of(context);
  bool isLoaded = false;
  List<ProductModel> products = [];
  List<ProductModel> filteredProducts = [];
  Future<void> getProduct() async {
    if (isLoaded) {
      emit(GetProductSuccessState(products: products));
      return;
    }
    emit(GetProductLoadingState());
    var response = await ProductRepoImplementation().getProducts();
    response.fold(
      (onError) =>
          emit(GetProductErrorState(errorMessage: onError.errorMessage)),
      (onSuccess) {
        products = onSuccess;
        filteredProducts = onSuccess;
        emit(GetProductSuccessState(products: products));
        isLoaded = true;
        filterProducts();
      },
    );
  }

  HashSet<String> categories = HashSet<String>();
  double minPrice = 0.0;
  double maxPrice = 0.0;
  void filterProducts() {
    categories.clear();
    minPrice = products[0].price;
    maxPrice = products[0].price;
    for (var element in products) {
      categories.add(element.category);
      minPrice = element.price < minPrice ? element.price : minPrice;
      maxPrice = element.price > maxPrice ? element.price : maxPrice;
    }
  }

  void applyFilters({
    List<String>? selectedCategories,
    double? selectedMinPrice,
    double? selectedMaxPrice,
  }) {
    filteredProducts =
        products.where((product) {
          final inCategory =
              selectedCategories == null ||
              selectedCategories.contains(product.category);
          final inPriceRange =
              (selectedMinPrice == null || product.price >= selectedMinPrice) &&
              (selectedMaxPrice == null || product.price <= selectedMaxPrice);
          return inCategory && inPriceRange;
        }).toList();

    emit(GetProductSuccessState(products: filteredProducts));
  }
}
