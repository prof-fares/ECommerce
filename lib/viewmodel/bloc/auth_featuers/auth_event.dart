import 'package:equatable/equatable.dart';

class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}

class SignupEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;
  SignupEvent(
      {required this.email,
      required this.password,
      required this.name,
      required this.phone,
      required this.rePassword});
  @override
  List<Object> get props => [email, password, name, phone, rePassword];
}

class TogglePasswordVisibilityEvent extends AuthEvent {}
class AuthResetEvent extends AuthEvent {}