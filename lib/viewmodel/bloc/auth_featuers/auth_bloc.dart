import 'package:bloc/bloc.dart';
import 'package:ecommerce/constant/sharedpref.dart';
import 'package:ecommerce/data/repos/repos_interface/regestration_repo.dart';
import 'package:ecommerce/data/web_services/cart_web_service.dart';
import 'package:ecommerce/data/web_services/curdWebServices.dart';
import 'package:ecommerce/data/web_services/wishlist_webService.dart';
import 'package:ecommerce/viewmodel/bloc/auth_featuers/auth_event.dart';
import 'package:ecommerce/viewmodel/bloc/auth_featuers/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/injection.dart';


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
     on<AuthResetEvent>((event, emit) {
      // Emit the initial state to reset the bloc
      emit(AuthInitial());
    });

    on<LoginEvent>((event, emit) async{
    
     emit(AuthLoading());
     try {
            print("*******+++++++++++++++++++++++++*****************++++++++++++++++");
          print("-------------------");
          print("${event.email}");
          print("${event.password}");
      final userInfo =await logInRepository.login(event.email, event.password);
            print("========*****${sl<LogInRepository>().token!}=*=*=**=*=*\n${sl<LogInRepository>().name!}\n============**=*=*${sl<LogInRepository>().email!}=************=*\n");
      print("*******+++++++++++");

     TokenManager.saveToken(sl<LogInRepository>().token!);
      TokenManager.saveToken(userInfo.token!);
      NameManger.saveName(userInfo.user!.name!);
      MailManger.saveEmail(userInfo.user!.email!);
   
    await updateServices(sl<LogInRepository>().token!);
      emit(Authenticated(userinfo: userInfo,message:"Login Succes"));
     } catch (e){
      print("========*****${sl<LogInRepository>().token!}=*=*=**=*=*\n${sl<LogInRepository>().name!}\n============**=*=*${sl<LogInRepository>().email!}=************=*\n");
      emit(AuthError(message: "Login failed ${e}"));
     }
    });
   on<SignupEvent>((event, emit) async{
     emit(AuthLoading());
     try {
      final userInfo =await signUpRepository.signup(event.name,event.email,event.password,event.rePassword,event.phone);
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
updateServices(String token){
 print("work");
  sl<CartWebService>().updateToken(token);
  sl<WishListWebService>().updateToken(token);
  sl<CurdWebServices>().updateToken(token);

}