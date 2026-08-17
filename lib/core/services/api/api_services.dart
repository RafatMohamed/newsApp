import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/consts/api_const.dart';
import 'package:news_app/core/model/sourcesModel/source_model.dart';

import '../../model/articalsModel/articles_model.dart';
class ApiServices {
///https://newsapi.org/v2/top-headlines/sources?category=general&apiKey=5e9253dd8c7f40de9799d329e5211e93&
  ///   https://newsapi.org/v2/top-headlines?country=us&apiKey=5e9253dd8c7f40de9799d329e5211e93

  static Future<SourceModel> getSources(String categoryID)async{
    final Uri url = Uri.https(ApiConst.baseURl, ApiConst.sourceEndPoint,{
      "apiKey":ApiConst.apiKey,
      "category":categoryID
    });
   final http.Response response =await http.get(url);
   final Map<String,dynamic> jsonResponse= jsonDecode(response.body);
   final result= SourceModel.fromJson(jsonResponse);
   return result;

  }

  static Future<ArticlesModel> getArticals(String sourceID)async{
    final Uri url = Uri.https(ApiConst.baseURl, ApiConst.articalsEndPoint,{
      "apiKey":ApiConst.apiKey,
      "sources":sourceID
    });
   final http.Response response =await http.get(url);
   final Map<String,dynamic> jsonResponse= jsonDecode(response.body);
   final result= ArticlesModel.fromJson(jsonResponse);
   return result;
  }
}
