import 'package:flutter/material.dart';
import 'package:simple_e_commerce/core/utils/app_fonts/app_fonts.dart';
import 'package:simple_e_commerce/features/product_details_feature/presentation/views/widgets/add_to_cart_button.dart';
import 'package:simple_e_commerce/features/product_feature/data/models/product_model.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              widget.product.images[0],
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text(widget.product.title, style: AppFonts.textStyleBold20),
          Text(
            "${widget.product.price.toStringAsFixed(2)} \$",
            style: AppFonts.textStyleBoldGreen20,
          ),
          if (widget.product.discountPercentage > 0)
            Text(
              "Discount: ${widget.product.discountPercentage.toStringAsFixed(1)}%",
              style: const TextStyle(color: Colors.red),
            ),
          const SizedBox(height: 16),
          Text("Description:", style: AppFonts.textStyleBold16),
          Text(widget.product.description),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text(
                "Availability: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                widget.product.availabilityStatus,
                style: TextStyle(
                  color:
                      widget.product.availabilityStatus == "In Stock"
                          ? Colors.green
                          : Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text("Warranty: ${widget.product.warrantyInformation}"),
          Text("Shipping: ${widget.product.shippingInformation}"),
          const SizedBox(height: 8),
          Text("Minimum Order: ${widget.product.minimumOrderQuantity} pcs"),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text(
                "Quantity:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  if (quantity > 0) {
                    setState(() {
                      quantity--;
                    });
                  }
                },
              ),
              Text(quantity.toString(), style: const TextStyle(fontSize: 16)),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  if (quantity < widget.product.stock) {
                    setState(() {
                      quantity++;
                    });
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          AddToCartButton(quantity: quantity, widget: widget),
        ],
      ),
    );
  }
}
