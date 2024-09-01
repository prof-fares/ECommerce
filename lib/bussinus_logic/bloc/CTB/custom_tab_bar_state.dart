part of 'custom_tab_bar_bloc.dart';

sealed class CustomTabBarState extends Equatable {
  const CustomTabBarState();
  
  @override
  List<Object> get props => [];
}

final class CustomTabBarInitial extends CustomTabBarState {}
class TabChangedState extends CustomTabBarState{
  final bool lightWomenF;
  final bool lightMenF;
  TabChangedState({required this.lightWomenF,required this.lightMenF});
   @override
  List<Object> get props => [lightWomenF,lightMenF];
}
