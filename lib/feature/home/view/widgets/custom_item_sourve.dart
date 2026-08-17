import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/model/articalsModel/articles_item_model.dart';
import 'package:news_app/core/utils/app_border_radius.dart';
import 'package:news_app/core/utils/app_padding.dart';
import 'package:news_app/core/utils/utils_app_helper.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../core/widgets/custom_widget_image.dart';

class CustomItemSource extends StatelessWidget {
  const CustomItemSource({super.key, required this.articles});
  final ArticlesItemsModel articles;
  @override
  Widget build(BuildContext context) {
    final ThemeData colorTheme = GetThemData.getColorThemData(context);
    final TextTheme textTheme = GetThemData.getTextThemData(context);
    final height = context.height;
    return Container(
      clipBehavior: .antiAlias,
      padding: const EdgeInsetsDirectional.all(AppPadding.p8),
      decoration: BoxDecoration(
        color: colorTheme.primaryColor,
        borderRadius: BorderRadiusDirectional.circular(AppBorderRadius.r16),
        border: Border.all(
          color: colorTheme.secondaryHeaderColor,
          style: .solid,
        ),
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 10,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(AppBorderRadius.r16),
            child: CustomImageAppWidget(pathImage: articles.urlToImage!, height: height),
          ),
          Text(
            articles.title!,
            style: textTheme.bodyMedium,
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Expanded(
                flex: 7,
                child: Text(
                  "By : ${articles.author}",
                  style: textTheme.labelSmall,
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  timeago.format(
                    DateTime.parse(articles.publishedAt!),
                    locale: context.locale.languageCode == "ar"
                        ? "ar"
                        : "en",
                  ),
                  style: textTheme.labelSmall,
                  maxLines: 1,
                  textAlign: .end,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

