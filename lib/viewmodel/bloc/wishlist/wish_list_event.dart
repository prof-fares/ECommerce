part of 'wish_list_bloc.dart';

sealed class WishListEvent extends Equatable {
  const WishListEvent();

  @override
  List<Object> get props => [];
}
class Getwishlist extends WishListEvent{
 

  Getwishlist();
   @override
  List<Object> get props => [];

}
class Addwishlist extends WishListEvent{

  final WhilShitModel wishlistmodel;
  final productid;
  Addwishlist({required this.productid,required this.wishlistmodel});
   @override
  List<Object> get props => [productid,wishlistmodel];

}
class Removewishlist extends WishListEvent{

 
  final  WhilShitModel wishlistmodel;
  final productid;
 Removewishlist({required this.productid,required this.wishlistmodel});
   @override
  List<Object> get props => [productid,wishlistmodel];

}
class ToggleFavEvent extends WishListEvent{
 final WhilShitModel wishlistmodel;
 final String productid;
  ToggleFavEvent ({required this.wishlistmodel,required this.productid});
  @override
  List<Object> get props => [wishlistmodel,productid];

}
class WishlistResetEvent extends WishListEvent {}