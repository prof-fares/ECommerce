import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
class TokenManager {

   static final _instance =TokenManager._internal();
   static SharedPreferences? _prefs;
   TokenManager._internal();
   factory TokenManager(){
      return _instance;
    }
     Future <void> init() async{
     _prefs = await SharedPreferences.getInstance();
     }

  static const _tokenKey = 'user_token';

  // تخزين التوكين
  static Future<void> saveToken(String token) async {
    
    await _prefs!.setString(_tokenKey, token);
  }

  // استرجاع التوكين
  static Future<String?> getToken() async {
   
    return _prefs!.getString(_tokenKey);
  }
  static Future<String?> removeToken() async {
   
  await _prefs!.remove(_tokenKey);
  }

}
class NameManger{
  static const _nameKey = 'user_name';
  static Future<void> saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nameKey, name);
  }
  static Future<String?> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_nameKey);
  }

}

class MailManger{
  static const _mailKey = 'user_mail';
  static Future<void> saveEmail(String mail) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_mailKey, mail);
  }
  static Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_mailKey);
  }

}