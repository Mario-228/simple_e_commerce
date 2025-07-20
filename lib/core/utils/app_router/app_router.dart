import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_e_commerce/features/home_feature/presentation/views/home_view.dart';
import 'package:simple_e_commerce/features/login_feature/presentation/views/login_view.dart';
import 'package:simple_e_commerce/features/login_feature/presentation/views_models/login_cubit/login_cubit.dart';
import 'package:simple_e_commerce/features/product_details_feature/presentation/views/product_details_view.dart';
import 'package:simple_e_commerce/features/product_feature/data/models/product_model.dart';
import 'package:simple_e_commerce/features/register_feature/presentation/views/register_view.dart';
import 'package:simple_e_commerce/features/register_feature/presentation/views_models/register_cubit/register_cubit.dart';

abstract class AppRouter {
  static const String login = '/';
  static const String register = '/register';
  static const String home = '/home';
  static const String productDetails = '/productDetails';
  static final routers = GoRouter(
    routes: [
      GoRoute(
        path: login,
        builder:
            (context, state) => BlocProvider(
              create: (context) => LoginCubit(),
              child: const LoginView(),
            ),
      ),
      GoRoute(
        path: register,
        builder:
            (context, state) => BlocProvider(
              create: (context) => RegisterCubit(),
              child: const RegisterView(),
            ),
      ),
      GoRoute(path: home, builder: (context, state) => const HomeView()),
      GoRoute(
        path: productDetails,
        builder:
            (context, state) =>
                ProductDetailsView(productModel: state.extra as ProductModel),
      ),
    ],
  );
}
