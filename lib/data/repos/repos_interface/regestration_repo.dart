import 'package:ecommerce/model/usermodel.dart';

abstract class LogInRepository{
   Future<Userinfo> login(String email, String password);
   String? get token;
   String?get name;
    String?get email;
}
abstract class SignUpRepository{
  Future<Userinfo> signup(String name, String email,String password,String rePassword,String phone);
}