import 'package:ecommerce/data/model/usermodel.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final String message;
  final Userinfo userinfo;
  Authenticated({required this.userinfo,required this.message});
  @override
  List<Object> get props => [userinfo];
}
class AuthError extends AuthState {
  final String message;
  AuthError({required this.message});
  @override
  List<Object> get props => [message];
}
class PasswordVisibilityState extends AuthState {
  final bool isPasswordVisible;

  PasswordVisibilityState({required this.isPasswordVisible});

  @override
  List<Object> get props => [isPasswordVisible];
}
