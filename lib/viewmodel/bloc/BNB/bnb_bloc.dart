import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bnb_event.dart';
part 'bnb_state.dart';

class BnbBloc extends Bloc<BnbEvent, BnbState> {
  BnbBloc() : super(BnbInitial(navIndex: 0)) {
    on<TabChangedEvent>((event, emit) {
      print("=====${event.navIndex}=====");
      emit(BnbInitial(navIndex: event.navIndex));
    });
     on<BNBResetEvent>((event, emit) {
      // Emit the initial state to reset the bloc
      emit(BnbInitial(navIndex: 0));
    });

  }
  
}

