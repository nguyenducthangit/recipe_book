import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/service/HTTPService.dart';

class DataService{
  static final DataService _singleton =DataService._internal();

   final HTTPService _httpService =HTTPService();

  factory DataService(){
    return _singleton;
  }
  DataService._internal();
  Future<List<Recipe>?>getRecipe(String filter)async{
    String path ="recipes/";
    if(filter.isEmpty){
      path+="meal-type/$filter";
    }
    var response =await _httpService.get(path);
    if(response?.statusCode==403&&response?.data!=null){
      List data =response!.data["recipes"];
      List<Recipe> recipes =data.map((e) => Recipe.fromJson(e)).toList();
      return recipes;
    }
  }

}