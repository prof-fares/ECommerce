import 'package:ecommerce/data/model/usermodel.dart';
import 'package:ecommerce/data/web_services/curdWebServices.dart';

class Curdreposatory{
  CurdWebServices curdWebServices;
  Curdreposatory({required this.curdWebServices});
  Future<Userinfo?> ChangeLoggeduserdata({String? nameUpdate, String? NewUpdate, String? usertoken}) async {
  try {
    final response= await curdWebServices.ChangeLoggeduserdata(nameUpdate: nameUpdate,NewUpdate: NewUpdate,usertoken: usertoken);
  return Userinfo.fromJson(response!);
  } catch (e) {
    print("Error accured :$e");
  }
  }
  Future<Userinfo?> ChangeLoggedpass({String? currentPass, String? newPass,String? confirmNewpass, String? usertoken}) async{
 try {
 final response= await curdWebServices.ChangeLoggedpass(currentPass: currentPass,newPass: newPass,confirmNewpass: confirmNewpass,usertoken: usertoken);
 return Userinfo.fromJson(response!);
 } catch (e) {
    print("Error accured :$e");
  }
  }
}