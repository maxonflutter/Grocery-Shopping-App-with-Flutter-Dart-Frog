import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

import '../blocs/cart/cart_bloc.dart';

class GroceryCartList extends StatelessWidget {
  const GroceryCartList({
    super.key,
    this.cartItems,
  });

  final List<CartItem>? cartItems;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return cartItems == null || cartItems!.isEmpty
        ? const Center(
            child: Text('No items in the cart'),
          )
        : ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cartItems!.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const Divider(height: 32.0);
            },
            itemBuilder: (BuildContext context, int index) {
              final cartItem = cartItems![index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.network(
                        cartItem.product.imageUrl,
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItem.product.name,
                              style: textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              cartItem.product.description,
                              style: textTheme.bodySmall,
                              maxLines: 3,
                            ),
                            Text(
                              '${cartItem.product.price}',
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          visualDensity: VisualDensity.compact,
                          onPressed: () {
                            context.read<CartBloc>().add(
                                  RemoveFromCart(
                                      userId: '12345', cartItem: cartItem),
                                );
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        Text('${cartItem.quantity}'),
                        IconButton(
                          visualDensity: VisualDensity.compact,
                          onPressed: () {
                            context.read<CartBloc>().add(
                                  AddToCart(
                                      userId: '12345',
                                      product: cartItem.product),
                                );
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
  }
}
