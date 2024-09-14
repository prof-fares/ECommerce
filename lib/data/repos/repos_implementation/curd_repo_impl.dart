import 'package:ecommerce/data/repos/repos_interface/curd_repo.dart';
import 'package:ecommerce/model/usermodel.dart';
import 'package:ecommerce/data/web_services/curdWebServices.dart';

class CurdReposatoryAPI extends CurdReposatory{
  CurdWebServices curdWebServices;
  CurdReposatoryAPI({required this.curdWebServices});
  @override
  Future<Userinfo?> ChangeLoggeduserdata({required String? nameUpdate,required String? NewUpdate}) async {
  try {
    final response= await curdWebServices.ChangeLoggeduserdata(nameUpdate: nameUpdate,newUpdate: NewUpdate);
  return Userinfo.fromJson(response!);
  } catch (e) {
    print("Error accured :$e");
      return null;
  }
  }
  
  @override

  Future<Userinfo?> ChangeLoggedpass({required String? currentPass,required String? newPass,required String? confirmNewpass}) async{
 try {
 final response= await curdWebServices.ChangeLoggedpass(currentPass: currentPass,newPass: newPass,confirmNewpass: confirmNewpass);
 return Userinfo.fromJson(response!);
 } catch (e) {
    print("Error accured :$e");
      return null;
  }
  }
}