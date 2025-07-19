import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_e_commerce/features/product_feature/presentation/views/widgets/custom_product_item.dart';
import 'package:simple_e_commerce/features/product_feature/presentation/views_models/get_product_cubit/get_product_cubit.dart';
import 'package:simple_e_commerce/features/product_feature/presentation/views_models/get_product_cubit/get_product_states.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductCubit, GetProductStates>(
      builder: (context, state) {
        if (state is GetProductErrorState) {
          return Center(child: Text(state.errorMessage));
        } else if (state is GetProductSuccessState) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: state.products.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10.0),
            itemBuilder:
                (context, index) =>
                    CustomProductItem(productModel: state.products[index]),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
