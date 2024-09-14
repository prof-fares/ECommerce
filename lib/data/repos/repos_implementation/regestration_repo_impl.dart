import 'package:ecommerce/data/repos/repos_interface/regestration_repo.dart';
import 'package:ecommerce/model/usermodel.dart';
import 'package:ecommerce/data/web_services/regestration_web_services.dart';



class LogInRepositoryApi extends LogInRepository {
  final  LogInWebservices logInWebservices ;
  String?_token;
  String?_name;
  String? _email;
 
  LogInRepositoryApi({required this.logInWebservices});
  @override
   Future<Userinfo> login(String email, String password) async{
 
   final response =await logInWebservices.login(email, password);

  
     _token=Userinfo.fromJson(response!).token!;

    _email=Userinfo.fromJson(response).user!.email;
   
    _name=Userinfo.fromJson(response).user!.name;

   // حفظ التوكين هنا
   return Userinfo.fromJson(response);
   }
     @override
    String? get token=>_token;
    String?get name=>_name;
    String?get email=>_email;
     // إتاحة التوكين عبر getter

}
class SignUpRepositoryApi extends SignUpRepository {
  final  SignUpWebservices signupWebservices ;
  SignUpRepositoryApi({required this.signupWebservices});
  @override
  Future<Userinfo> signup(String name, String email,String password,String rePassword,String phone) async{
   final response =await signupWebservices.Signup(name, email, password, rePassword, phone);
   return Userinfo.fromJson(response!);
   }


}