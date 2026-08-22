import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/consts/api_const.dart';
import 'package:news_app/core/model/sourcesModel/source_model.dart';

import '../../model/articalsModel/articles_model.dart';
class ApiServices {
///https://newsapi.org/v2/top-headlines/sources?category=general&apiKey=5e9253dd8c7f40de9799d329e5211e93&
  ///   https://newsapi.org/v2/top-headlines?country=us&apiKey=5e9253dd8c7f40de9799d329e5211e93
/// https://newsapi.org/v2/everything?q=Apple&from=2026-08-16&sortBy=popularity&apiKey=ad3e59943b25408ca65259fa577be2e4
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

  static Future<ArticlesModel> getArticals({required String sourceID,required int page,required int pageSize})async{
    final Uri url = Uri.https(ApiConst.baseURl, ApiConst.articalsEndPoint,{
      "apiKey":ApiConst.apiKey,
      "pageSize":pageSize.toString(),
      "page":page.toString(),
      "sources":sourceID
    });
   final http.Response response =await http.get(url);
   final Map<String,dynamic> jsonResponse= jsonDecode(response.body);
   final result= ArticlesModel.fromJson(jsonResponse);
   return result;
  }

  static Future<ArticlesModel> getArticalsOnSearch(String query)async{
    final Uri url = Uri.https(ApiConst.baseURl, ApiConst.searchEveryThingEndPoint,{
      "apiKey":ApiConst.apiKey,
      "q":query,
      "sortBy":"popularity",
      "from":DateFormat("'yyyy-MM-dd'").format(DateTime.now().subtract(const Duration(days: 1))),
    });
   final http.Response response =await http.get(url);
   final Map<String,dynamic> jsonResponse= jsonDecode(response.body);
   final result= ArticlesModel.fromJson(jsonResponse);
   return result;
  }
}
