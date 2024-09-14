import 'package:dio/dio.dart';
import 'package:ecommerce/data/web_services/dioSetUp/dio_client.dart';

class CurdWebServices {
 late DioClient _dioClient ;
  String? userToken;
 CurdWebServices({ this.userToken}){
    _dioClient=DioClient() ;
  }
 void updateToken(String token) {
    userToken = token;
    _dioClient = DioClient();
  }
  Future<Map<String, dynamic>?> ChangeLoggeduserdata(
      {String? nameUpdate, dynamic newUpdate}) async {
       Map<String,dynamic> data={
          nameUpdate!:newUpdate
       };
      try {
      Response response = await _dioClient.putData("/api/v1/users/updateMe/", data: data,headers:{"token":userToken} );
      if (response.statusCode == 200) {
        print( "=====================*******=============${response.data}=================****================");
        return response.data;
      } else {
        print('=========================== Change logged user data failed with status: ${response.statusCode}====================');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }
  Future<Map<String, dynamic>?> ChangeLoggedpass({String? currentPass, String? newPass,String? confirmNewpass}) async{
       try {
      Response response = await _dioClient.putData("/api/v1/users/changeMyPassword",  data: {
            "currentPassword" : currentPass,
            "password":newPass,
            "rePassword":confirmNewpass
          },headers:{"token":userToken});
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('=========================== Change logged user pass failed with status: ${response.statusCode}====================');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }
}
