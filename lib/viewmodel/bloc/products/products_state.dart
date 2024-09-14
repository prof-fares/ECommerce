part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();
  
  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}
class ProducdtsLoading extends ProductsState{}
class ProductsLoded extends ProductsState{
 final ProductsModel productsModel;
  ProductsLoded({required this.productsModel});
   @override
  List<Object> get props => [productsModel];
}
class ProductsError extends ProductsState{
  final String message ;
  ProductsError({required this.message});
   @override
  List<Object> get props => [message];

}
class QuantityChanged extends ProductsState{
  final newvalue;
  QuantityChanged({required this.newvalue});
   @override
  List<Object> get props => [newvalue];}
 class SizeChangeState  extends ProductsState{
 final index;
 SizeChangeState({required this.index});
   @override
  List<Object> get props => [index];
 }
 class ColorChangeState  extends ProductsState{
 final index;
 ColorChangeState({required this.index});
   @override
  List<Object> get props => [index];
 }
  
