import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_e_commerce/features/product_feature/data/repos/product_repo_implementation.dart';
import 'package:simple_e_commerce/features/product_feature/presentation/views_models/get_product_cubit/get_product_states.dart';

class GetProductCubit extends Cubit<GetProductStates> {
  GetProductCubit() : super(GetProductInitialState());

  static GetProductCubit get(BuildContext context) => BlocProvider.of(context);
  bool isLoaded = false;
  Future<void> getProduct() async {
    if (isLoaded) return;
    emit(GetProductLoadingState());
    var response = await ProductRepoImplementation().getProducts();
    response.fold(
      (onError) =>
          emit(GetProductErrorState(errorMessage: onError.errorMessage)),
      (onSuccess) {
        emit(GetProductSuccessState(products: onSuccess));
        isLoaded = true;
      },
    );
  }
}
