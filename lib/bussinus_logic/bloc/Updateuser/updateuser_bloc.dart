import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/repositry/curdreposatory.dart';
import 'package:equatable/equatable.dart';

part 'updateuser_event.dart';
part 'updateuser_state.dart';

class UpdateuserBloc extends Bloc<UpdateuserEvent, UpdateuserState> {
  Curdreposatory curdreposatory;
  UpdateuserBloc({required this.curdreposatory}) : super(UpdateuserInitial()) {
    on<UpdateuserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
