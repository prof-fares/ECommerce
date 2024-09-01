part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();
  
  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

class ItemsLoading extends CartState{
}
class ItemsError extends CartState{
  final message;
  ItemsError({required this.message});
   @override
  List<Object> get props => [message];
}
class ItemsLoaded extends CartState{
 final CartItem cartItem;
  ItemsLoaded({required this.cartItem});
   @override
  List<Object> get props => [cartItem];
}


