import 'package:models/models.dart';
import 'package:uuid/uuid.dart';

class CartRepository {
  final Map<String, Map<String, CartItem>> _inMemoryCarts = {};

  Future<List<CartItem>> getCartItems(String userId) async {
    return _inMemoryCarts[userId]?.values.toList() ?? [];
  }

  Future<CartItem> addToCart(String userId, Product product) async {
    _inMemoryCarts.putIfAbsent(userId, () => {});

    final userCart = _inMemoryCarts[userId]!;
    CartItem? existingItem;
    if (userCart.values.isNotEmpty) {
      existingItem = userCart.values
          .where((item) => item.product.id == product.id)
          .firstOrNull;

      if (existingItem != null) {
        // Update the existing item if it's already in the cart
        final updatedItem = existingItem.copyWith(
          quantity: existingItem.quantity + 1,
          subtotal: existingItem.subtotal + product.price,
        );

        _inMemoryCarts[userId]![existingItem.id] = updatedItem;
        return updatedItem;
      }
    }

    // Add a new item if it's not in the cart
    final newItem = CartItem(
      id: const Uuid().v4(),
      product: product,
      quantity: 1,
      subtotal: product.price,
    );

    _inMemoryCarts[userId]![newItem.id] = newItem;
    return newItem;
  }

  Future<void> removeFromCart(String userId, String itemId) async {
    if (_inMemoryCarts[userId]?.containsKey(itemId) == true) {
      _inMemoryCarts[userId]!.remove(itemId);
    }
  }
}
