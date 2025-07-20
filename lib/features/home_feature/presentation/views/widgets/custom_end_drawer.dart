import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:simple_e_commerce/core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/variables_locator_service/variables_locator_service.dart';
import '../../../../../core/widgets/custom_material_button.dart';

class CustomEndDrawer extends StatefulWidget {
  const CustomEndDrawer({super.key});
  @override
  State<CustomEndDrawer> createState() => _CustomEndDrawerState();
}

class _CustomEndDrawerState extends State<CustomEndDrawer> {
  List<String> selectedCategories = [];
  late RangeValues rangeValues;
  late double min;
  late double max;
  @override
  void initState() {
    super.initState();
    min = VariablesLocatorService.getProductCubit.minPrice;
    max = VariablesLocatorService.getProductCubit.maxPrice;
    rangeValues = RangeValues(min, max);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Filter by Category",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            CustomMaterialButton(
              text: 'Select Categories',
              color: Colors.orange,
              onPressed: () async {
                await FilterListDialog.display<String>(
                  context,
                  listData:
                      VariablesLocatorService.getProductCubit.categories
                          .toList(),
                  selectedListData: selectedCategories,
                  height: 480,
                  headlineText: "Select Categories",
                  choiceChipLabel: (category) => category,
                  validateSelectedItem: (list, item) => list!.contains(item),
                  onItemSearch:
                      (item, query) =>
                          item.toLowerCase().contains(query.toLowerCase()),
                  themeData: FilterListThemeData.light(context),
                  resetButtonText: "Reset",
                  onApplyButtonClick: (list) {
                    if (list == null || list.isEmpty) {
                      selectedCategories.clear();
                      VariablesLocatorService.getProductCubit.getProduct();
                    } else {
                      selectedCategories = list;
                      VariablesLocatorService.getProductCubit.applyFilters(
                        selectedCategories: selectedCategories,
                      );
                    }
                    Navigator.pop(context);
                  },
                );
              },
            ),
            const SizedBox(height: 24),
            const Text(
              "Filter by Price",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              "Price Range: ${rangeValues.start.toStringAsFixed(2)} - ${rangeValues.end.toStringAsFixed(2)}",
            ),
            RangeSlider(
              values: rangeValues,
              min: min,
              max: max,
              divisions: 100,
              activeColor: Colors.orange,
              labels: RangeLabels(
                rangeValues.start.toStringAsFixed(2),
                rangeValues.end.toStringAsFixed(2),
              ),
              onChanged: (values) {
                setState(() {
                  rangeValues = values;
                });
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: CustomMaterialButton(
                text: "Apply Price Filter",
                color: AppColors.darkGreen,
                onPressed: () {
                  VariablesLocatorService.getProductCubit.applyFilters(
                    selectedMinPrice: rangeValues.start,
                    selectedMaxPrice: rangeValues.end,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: CustomMaterialButton(
                text: "Apply All Filters",
                color: AppColors.glodenOrange,
                onPressed: () {
                  VariablesLocatorService.getProductCubit.applyFilters(
                    selectedCategories: selectedCategories,
                    selectedMinPrice: rangeValues.start,
                    selectedMaxPrice: rangeValues.end,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: CustomMaterialButton(
                text: "Reset Filters",
                color: Colors.red,
                onPressed: () {
                  VariablesLocatorService.getProductCubit.getProduct();
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
