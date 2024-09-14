part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

class CategoryLoding extends CategoryState {}

class CategoryLoded extends CategoryState {
  final CategoryModel categoryModel;
  CategoryLoded({required this.categoryModel});
  @override
  List<Object> get props => [categoryModel];
}
class CategoryError extends CategoryState{
final String message;
CategoryError({required this.message});
 @override
  List<Object> get props => [message];
}