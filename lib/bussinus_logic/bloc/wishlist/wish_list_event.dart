part of 'wish_list_bloc.dart';

sealed class WishListEvent extends Equatable {
  const WishListEvent();

  @override
  List<Object> get props => [];
}
class Getwishlist extends WishListEvent{
  final token ;

  Getwishlist({required this.token,});
   @override
  List<Object> get props => [token,];

}
class Addwishlist extends WishListEvent{
  final token ;
  WhilShitModel wishlistmodel;
  final productid;
  Addwishlist({required this.token,required this.productid,required this.wishlistmodel});
   @override
  List<Object> get props => [token,productid,wishlistmodel];

}
class Removewishlist extends WishListEvent{

  final token ;
    WhilShitModel wishlistmodel;
  final productid;
 Removewishlist({required this.token,required this.productid,required this.wishlistmodel});
   @override
  List<Object> get props => [token,productid,wishlistmodel];

}
class ToggleFavEvent extends WishListEvent{
  WhilShitModel wishlistmodel;
  String productid;
  ToggleFavEvent ({required this.wishlistmodel,required this.productid});
  @override
  List<Object> get props => [wishlistmodel,productid];

}