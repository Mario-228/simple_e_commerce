import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_e_commerce/core/utils/variables_locator_service/variables_locator_service.dart';
import 'package:simple_e_commerce/features/product_feature/presentation/views/widgets/product_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: BlocProvider.value(
          value: VariablesLocatorService.getProductCubit,
          child: ProductViewBody(),
        ),
      ),
    );
  }
}
