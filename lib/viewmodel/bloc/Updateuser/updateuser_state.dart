part of 'updateuser_bloc.dart';

sealed class UpdateuserState extends Equatable {
  const UpdateuserState();
  
  @override
  List<Object> get props => [];
}

final class UpdateuserInitial extends UpdateuserState {}
class Updated extends UpdateuserState{
  final User updateValue;
  Updated({required this.updateValue});
@override
  List<Object> get props => [updateValue];
}
class LoggedUserDateGetted extends UpdateuserState{
   final String name;
   final String email;

  LoggedUserDateGetted({required this.name,required this.email});
  @override
   List<Object> get props => [name,email];
}
class UpdateError extends UpdateuserState{
  final String message ;
  UpdateError({required this.message});
   @override
  List<Object> get props => [message];
}
class UpdateLoading extends UpdateuserState{}