import 'package:ecommerce/model/usermodel.dart';

abstract class CurdReposatory{
    Future<Userinfo?> ChangeLoggeduserdata({required String? nameUpdate,required String? NewUpdate});
    Future<Userinfo?> ChangeLoggedpass({required String? currentPass,required String? newPass,required String? confirmNewpass});
}