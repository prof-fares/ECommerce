part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}
class UbdateItemEvent extends CartEvent{
  final token;
  final productid;
  final count;
  UbdateItemEvent({required this.productid,required this.token,required this.count});
   @override
  List<Object> get props => [productid,token,count];

}
class RemoveItemEvent extends CartEvent{
  final token;
  final productid;
  
  RemoveItemEvent({required this.productid,required this.token});
   @override
  List<Object> get props => [productid,token];

}
class GetItemsEvent extends CartEvent{
  final token;

  GetItemsEvent({required this.token});
   @override
  List<Object> get props => [token];

}
class AddItemEvent extends CartEvent{
   final token;
   final productid;
   final count;
  AddItemEvent({required this.productid,required this.token,required this.count});
   @override
  List<Object> get props => [productid,token,count];

}


