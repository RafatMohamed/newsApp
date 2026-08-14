import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_border_radius.dart';
import 'package:news_app/core/utils/app_padding.dart';
import 'package:news_app/core/utils/utils_app_helper.dart';
import 'package:timeago/timeago.dart' as timeago;

class CustomItemSource extends StatelessWidget {
  const CustomItemSource({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData colorTheme = GetThemData.getColorThemData(context);
    final TextTheme textTheme = GetThemData.getTextThemData(context);
    final height = context.height;
    final sourceDateTime = DateTime.now().subtract(const Duration(days: 1000));
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
            child: Image.asset(
              "assets/images/Rectangle 2.png",
              height: height * 0.22,
              width: double.infinity,
              fit: .fill,
            ),
          ),
          Text(
            "40-year-old man falls 200 feet to his death while canyoneering at national park",
            style: textTheme.bodyMedium,
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Expanded(
                flex: 7,
                child: Text(
                  "By : Raafat Mohamed",
                  style: textTheme.labelSmall,
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  timeago.format(
                    sourceDateTime,
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
