import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:models/models.dart';

import '../blocs/cart/cart_bloc.dart';
import '../widgets/grocery_cart_list.dart';
import '../widgets/grocery_loading_indicator.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    Cart? cart = context.watch<CartBloc>().state.cart;
    int totalQuantity = cart?.totalQuantity ?? 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.inversePrimary,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Pickup',
              style: textTheme.bodySmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Location 1',
                  style: textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8.0),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ],
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.status == CartStatus.initial) {
            return const GroceryLoadingIndicator();
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '$totalQuantity Items in the Cart',
                    style: textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ExpansionTile(
                  shape: const RoundedRectangleBorder(side: BorderSide.none),
                  tilePadding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  childrenPadding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  backgroundColor: colorScheme.primaryContainer,
                  collapsedBackgroundColor: colorScheme.primaryContainer,
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  title: const Text('Substitutions: Substitute if unavailable'),
                  children: [
                    _buildSubstitutionOption(
                      context,
                      CartSubstitutionPreference.allowSubstitutions.name,
                      CartSubstitutionPreference.allowSubstitutions.description,
                      Icons.switch_left,
                    ),
                    const SizedBox(height: 8.0),
                    _buildSubstitutionOption(
                      context,
                      CartSubstitutionPreference.noSubstitutions.name,
                      CartSubstitutionPreference.noSubstitutions.description,
                      Icons.stop_circle,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CART ITEMS',
                        style: textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      GroceryCartList(cartItems: cart?.cartItems),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const _CartBottomNavBar(),
    );
  }

  Row _buildSubstitutionOption(
    BuildContext context,
    String title,
    String description,
    IconData iconData,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Icon(iconData)],
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(description),
            ],
          ),
        )
      ],
    );
  }
}

class _CartBottomNavBar extends StatelessWidget {
  const _CartBottomNavBar();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 104,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal:',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'USD ${context.watch<CartBloc>().state.cart?.totalPrice.toStringAsFixed(2) ?? 0.0}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: OutlinedButton(
                  onPressed: () => context.pop(),
                  child: const Text('Add More'),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                flex: 2,
                child: FilledButton(
                  onPressed: () {},
                  child: const Text('Checkout'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
