part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}
class GetProductsEvent extends ProductsEvent{
  final String Categoryid;

  GetProductsEvent({required this.Categoryid});
  @override
  List<Object> get props => [Categoryid];

}
class IncreaseQuantity extends ProductsEvent{
   @override
  List<Object> get props => [];
}
class DecreaseQuantity extends ProductsEvent{
   @override
  List<Object> get props => [];
}
class SizeChangeEvent extends ProductsEvent{
  final index;
  SizeChangeEvent({required this.index});
   @override
  List<Object> get props => [index];
}
class ColorChangeEvent extends ProductsEvent{
  final index;
  ColorChangeEvent({required this.index});
   @override
  List<Object> get props => [index];
}