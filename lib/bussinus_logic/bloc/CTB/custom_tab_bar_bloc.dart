import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'custom_tab_bar_event.dart';
part 'custom_tab_bar_state.dart';

class CustomTabBarBloc extends Bloc<CustomTabBarEvent, CustomTabBarState> {

  CustomTabBarBloc() : super(CustomTabBarInitial()) {
    on<OnTapEvent>((event, emit) {
      print("xxxxxxxxxxxxxxxxxxxxxxxxx");
   
     emit(TabChangedState(lightWomenF: event.lightWomenF, lightMenF: event.lightMenF));
    });
  }
}
