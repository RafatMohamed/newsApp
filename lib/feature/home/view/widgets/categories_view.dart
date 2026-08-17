import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/feature/home/models/categories_model.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/utils_app_helper.dart';
import '../../../../generated/assets.dart';
import 'custom_categories_items.dart';
typedef OnTapCategories = Function(CategoriesModel categoriesModel);
class CategoriesView extends StatelessWidget {
  const CategoriesView({
    super.key,
    required this.onTapCategories
  });
  final OnTapCategories onTapCategories;
  @override
  Widget build(BuildContext context) {
    List<CategoriesModel> categoriesItems=[
      CategoriesModel(id: "general", name: AppText.general, pathImage: Assets.images.general.path),
      CategoriesModel(id: "business", name: AppText.business, pathImage: Assets.images.busniess.path),
      CategoriesModel(id: "sports", name: AppText.sport, pathImage: Assets.images.sport.path),
      CategoriesModel(id: "technology", name: AppText.technology, pathImage: Assets.images.technology.path),
      CategoriesModel(id: "entertainment", name: AppText.entertainment, pathImage: Assets.images.entertainment.path),
      CategoriesModel(id: "health", name: AppText.health, pathImage: Assets.images.helth.path),
      CategoriesModel(id: "science", name: AppText.science, pathImage: Assets.images.science.path),
    ];
    final TextTheme textThem = GetThemData.getTextThemData(context);
    return Padding(
      padding: const EdgeInsetsDirectional.all(
          AppPadding.p16
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(AppText.headTitle, style: textThem.headlineSmall),
          const SizedBox(height: 20,),
          Expanded(
            child: ListView.separated(
              itemCount: categoriesItems.length,
              itemBuilder: (context, index) {
                final item = categoriesItems[index];
                return GestureDetector(
                  onTap: () {
                    onTapCategories.call(item);
                  },
                  child: CustomCategoriesItems(
                    categoriesItem: item,
                    index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 20,),
            ),
          ),
        ],
      ),
    );
  }
}
