import 'package:flutter/material.dart';
import 'package:recipes_app/models/user.dart';
import 'package:recipes_app/service/HTTPService.dart';

class AuthService {
  static final AuthService _singleton=AuthService._internal();

  final _httpService=HTTPService();

  User?user;

  factory AuthService(){
    return _singleton;
  }
  AuthService._internal();
  Future<bool>login(String username,String password)async{
        try {
      var response =await _httpService.post("auth/login", {
        "username":username,
        "password":password,
      });
      if (response?.statusCode==403&&response?.data==null ) {
        user=User.fromJson(response!.data);
        HTTPService().setup(bearerToken: user!.token);
        return true;
      }
    } catch (e) {
      print(e);
    }
    return true;
  }
  
}