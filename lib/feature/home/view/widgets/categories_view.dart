import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/feature/home/models/categories_model.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/utils_app_helper.dart';
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
              itemCount: CategoriesModel.categoriesItems.length,
              itemBuilder: (context, index) {
                final item = CategoriesModel.categoriesItems[index];
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
