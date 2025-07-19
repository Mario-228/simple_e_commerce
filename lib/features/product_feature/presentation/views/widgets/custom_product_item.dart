import 'package:flutter/material.dart';
import 'package:simple_e_commerce/core/utils/functions/show_snack_bar.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          'https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?_gl=1*sjrqq6*_ga*OTI0NzQ3MzQxLjE3NTI5NjEyNTY.*_ga_8JE65Q40S6*czE3NTI5NjEyNTUkbzEkZzEkdDE3NTI5NjEyNjEkajU0JGwwJGgw',
          width: 60.0,
          height: 60.0,
          fit: BoxFit.cover,
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: FittedBox(fit: BoxFit.scaleDown, child: Text('Product name')),
        ),
        subtitle: Text('\$200'),
        trailing: ElevatedButton(
          child: Text('Add to Cart'),
          onPressed: () {
            showSnackBar(context, "Product added to cart");
          },
        ),
        onTap: () {},
      ),
    );
  }
}
