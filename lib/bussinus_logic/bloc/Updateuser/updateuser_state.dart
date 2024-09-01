part of 'updateuser_bloc.dart';

sealed class UpdateuserState extends Equatable {
  const UpdateuserState();
  
  @override
  List<Object> get props => [];
}

final class UpdateuserInitial extends UpdateuserState {}
