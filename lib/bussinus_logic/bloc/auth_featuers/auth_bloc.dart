import 'package:bloc/bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/auth_featuers/auth_event.dart';
import 'package:ecommerce/bussinus_logic/bloc/auth_featuers/auth_state.dart';
import 'package:ecommerce/data/repositry/regestration_repositry.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
final LogInRepository logInRepository;
final TextEditingController emailController=TextEditingController();
final TextEditingController passController=TextEditingController();
final TextEditingController nameController=TextEditingController();
final TextEditingController signemailController=TextEditingController();
final TextEditingController signpassController=TextEditingController();
final TextEditingController repassController=TextEditingController();
final TextEditingController numberController=TextEditingController();
 final  SignUpRepository signUpRepository;
bool passvisaibl=false;
String? token;


  AuthBloc({required this.logInRepository,required this.signUpRepository}) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async{
     emit(AuthLoading());
     try {
      final userInfo =await logInRepository.login(event.email, event.password);
      emit(Authenticated(userinfo: userInfo,message:"Login Succes"));
     } catch (e){
      emit(AuthError(message: "Login failed $e"));
     }
    });
   on<SignupEvent>((event, emit) async{
     emit(AuthLoading());
     try {
      final userInfo =await signUpRepository.Signup(event.name,event.email,event.password,event.rePassword,event.phone);
      token=userInfo.token;
      emit(Authenticated(userinfo: userInfo,message:"SignUp Succes" ));
     } catch (e){
      emit(AuthError(message: "Sign failed $e "));
     }
    });
      on<TogglePasswordVisibilityEvent>((event, emit) {
      passvisaibl=!passvisaibl;
      emit(PasswordVisibilityState(isPasswordVisible: passvisaibl));
    });
  
  }
  
}
