part of 'custom_tab_bar_bloc.dart';

sealed class CustomTabBarEvent extends Equatable {
  const CustomTabBarEvent();

  @override
  List<Object> get props => [];
}
class OnTapEvent extends CustomTabBarEvent{
  final bool lightWomenF;
  final bool lightMenF;
  OnTapEvent({required this.lightMenF,required this.lightWomenF});
   @override
  List<Object> get props => [lightWomenF,lightMenF];
}