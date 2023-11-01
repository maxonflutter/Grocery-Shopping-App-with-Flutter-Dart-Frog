import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  final CartRepository _cartRepository;

  ShoppingCartBloc({required CartRepository cartRepository})
      : _cartRepository = cartRepository,
        super(const ShoppingCartState()) {
    on<ShoppingCartAddProductEvent>(_onAddProduct);
    on<ShoppingCartRemoveProductEvent>(_onRemoveProduct);
    on<ShoppingCartClearEvent>(_onClearCart);
  }

  Future<void> _onAddProduct(
    ShoppingCartAddProductEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    emit(state.copyWith(status: ShoppingCartStatus.loading));

    try {
      await _cartRepository.addToCart(event.product);
      emit(state.copyWith(status: ShoppingCartStatus.loaded));
    } catch (err) {
      emit(state.copyWith(status: ShoppingCartStatus.error));
    }
  }

  Future<void> _onRemoveProduct(
    ShoppingCartRemoveProductEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    emit(state.copyWith(status: ShoppingCartStatus.loading));

    try {
      await _cartRepository.removeFromCart(event.productId);
      emit(state.copyWith(status: ShoppingCartStatus.loaded));
    } catch (err) {
      emit(state.copyWith(status: ShoppingCartStatus.error));
    }
  }

  Future<void> _onClearCart(
    ShoppingCartClearEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    emit(state.copyWith(status: ShoppingCartStatus.loading));

    try {
      await _cartRepository.clearCart();
      emit(state.copyWith(status: ShoppingCartStatus.loaded));
    } catch (err) {
      emit(state.copyWith(status: ShoppingCartStatus.error));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}