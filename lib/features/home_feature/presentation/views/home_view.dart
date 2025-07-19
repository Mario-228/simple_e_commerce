import 'package:flutter/material.dart';
import 'package:simple_e_commerce/core/utils/app_fonts/app_fonts.dart';
import 'package:simple_e_commerce/features/cart_feature/presentation/views/cart_view.dart';
import 'package:simple_e_commerce/features/product_feature/presentation/views/product_view.dart';
import 'package:simple_e_commerce/features/profile_feature/presentation/views/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const List<Widget> screens = [
    ProductView(),
    CartView(),
    ProfileView(),
  ];
  static const List<String> titles = ['Products', 'Cart', 'Profile'];
  static int selectedIndex = 0;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          HomeView.titles[HomeView.selectedIndex],
          style: AppFonts.textStyleBold24,
        ),
        centerTitle: true,
      ),
      body: HomeView.screens[HomeView.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            HomeView.selectedIndex = index;
          });
        },
        currentIndex: HomeView.selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Products'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
