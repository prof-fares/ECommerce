part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}
class UbdateItemEvent extends CartEvent{
  
  final productid;
  final count;
  UbdateItemEvent({required this.productid,required this.count});
   @override
  List<Object> get props => [productid,count];

}
class RemoveItemEvent extends CartEvent{
 
  final productid;
  
  RemoveItemEvent({required this.productid});
   @override
  List<Object> get props => [productid];

}
class GetItemsEvent extends CartEvent{
 

  GetItemsEvent();
   @override
  List<Object> get props => [];

}
class AddItemEvent extends CartEvent{
  
   final productid;
   final count;
  AddItemEvent({required this.productid,required this.count});
   @override
  List<Object> get props => [productid,count];

}
class CartResetEvent extends CartEvent {}

