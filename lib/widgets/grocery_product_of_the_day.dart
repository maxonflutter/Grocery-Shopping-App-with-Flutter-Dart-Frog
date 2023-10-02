import 'package:flutter/material.dart';
import 'package:models/models.dart';

class GroceryProductOfTheDay extends StatelessWidget {
  const GroceryProductOfTheDay({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: size.width - 32.0,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        image: DecorationImage(
          image: NetworkImage(
            product.imageUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            product.name,
            style: textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            product.description,
            style: textTheme.bodyLarge!.copyWith(
              color: colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: 8.0),
          FilledButton.icon(
            onPressed: () {},
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(48.0),
            ),
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text('Order Now'),
          ),
        ],
      ),
    );
  }
}
