part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}
class GetCategoryEvent extends CategoryEvent{}
class StartAutoScroll extends CategoryEvent {}

class StopAutoScroll extends CategoryEvent {}