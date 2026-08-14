import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/generated/assets.dart';

class CategoriesModel {
  final String id;
  final String name;
  final String pathImage;

 CategoriesModel({required this.id,required this.name,required this.pathImage});

 static List<CategoriesModel> categoriesItems=[
   CategoriesModel(id: "", name: AppText.general, pathImage: Assets.images.general.path),
   CategoriesModel(id: "", name: AppText.business, pathImage: Assets.images.busniess.path),
   CategoriesModel(id: "", name: AppText.sport, pathImage: Assets.images.sport.path),
   CategoriesModel(id: "", name: AppText.technology, pathImage: Assets.images.technology.path),
   CategoriesModel(id: "", name: AppText.entertainment, pathImage: Assets.images.entertainment.path),
   CategoriesModel(id: "", name: AppText.health, pathImage: Assets.images.helth.path),
   CategoriesModel(id: "", name: AppText.science, pathImage: Assets.images.science.path),
 ];
}