part of 'wish_list_bloc.dart';

sealed class WishListState extends Equatable {
  const WishListState();
  
  @override
  List<Object> get props => [];
}

final class WishListInitial extends WishListState {}
class WishListGetted extends WishListState{
  WhilShitModel wishlist;
  List wishlistid;



  WishListGetted({ required this.wishlist,required this.wishlistid});
   @override
  List<Object> get props => [wishlist,wishlistid,];
}
class WishListAdded extends WishListState{
 WhilShitModel wishlist;
  WishListAdded({required this.wishlist});
   @override
  List<Object> get props => [wishlist];
}
class WishListRemoved extends WishListState{
  WhilShitModel wishlist;
  WishListRemoved({required this.wishlist});
   @override
  List<Object> get props => [wishlist];
}
class WshlistLoading extends WishListState{
  bool loading=true;
   @override
  List<Object> get props => [loading];
}
class WshlistError extends WishListState{
  final message;
  WshlistError ({required this.message});
    @override
  List<Object> get props => [message];
  

}
class ToggleFavState extends WishListState{
 bool isFav;
 ToggleFavState({required this.isFav});
   @override
  List<Object> get props => [isFav];
}

