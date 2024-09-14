import 'package:bloc/bloc.dart';
import 'package:ecommerce/viewmodel/bloc/BNB/bnb_bloc.dart';
import 'package:equatable/equatable.dart';
part 'custom_tab_bar_event.dart';
part 'custom_tab_bar_state.dart';

class CustomTabBarBloc extends Bloc<CustomTabBarEvent, CustomTabBarState> {

  CustomTabBarBloc() : super(CustomTabBarInitial()) {
     on<CTBResetEvent>((event, emit) {
      // Emit the initial state to reset the bloc
      emit(CustomTabBarInitial());
    });

    on<OnTapEvent>((event, emit) {
      print("xxxxxxxxxxxxxxxxxxxxxxxxx");
   
     emit(TabChangedState(lightWomenF: event.lightWomenF, lightMenF: event.lightMenF));
    });
  }
}
