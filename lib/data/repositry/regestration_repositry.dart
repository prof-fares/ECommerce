import 'package:ecommerce/data/model/usermodel.dart';
import 'package:ecommerce/data/web_services/regestration_web_services.dart';

class LogInRepository {
  final  LogInWebservices logInWebservices ;
  String? _token;
  LogInRepository({required this.logInWebservices});
   Future<Userinfo> login(String email, String password) async{
   final response =await logInWebservices.login(email, password);
    _token = Userinfo.fromJson(response!).token; // حفظ التوكين هنا
   return Userinfo.fromJson(response!);
   }
    String? get token => _token; // إتاحة التوكين عبر getter

}
class SignUpRepository {
  final  SignUpWebservices signupWebservices ;
  SignUpRepository({required this.signupWebservices});
  Future<Userinfo> Signup(String name, String email,String password,String rePassword,String phone) async{
   final response =await signupWebservices.Signup(name, email, password, rePassword, phone);
   return Userinfo.fromJson(response!);
   }


}