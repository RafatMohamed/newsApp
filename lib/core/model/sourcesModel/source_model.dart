
import 'package:news_app/core/model/sourcesModel/sources_item_model.dart';

class SourceModel {
  SourceModel({
      this.status, 
      this.sources,
      this.message,
      this.code,
  });

  SourceModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(SourcesItemModel.fromJson(v));
      });
    }
  }
  String? status;
  List<SourcesItemModel>? sources;
  String? message;
  String? code;
}