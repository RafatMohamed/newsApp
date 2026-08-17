import 'articles_item_model.dart';

class ArticlesModel {
  ArticlesModel({
      this.status, 
      this.totalResults, 
      this.articles,
      this.message,
      this.code,
  });

  ArticlesModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(ArticlesItemsModel.fromJson(v));
      });
    }
  }
  String? status;
  num? totalResults;
  List<ArticlesItemsModel>? articles;
  String? message;
  String? code;

}