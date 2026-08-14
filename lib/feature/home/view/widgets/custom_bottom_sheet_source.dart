import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/custom_button_app.dart';
import '../../../../core/utils/app_border_radius.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/utils_app_helper.dart';

class CustomBottomSheetSource extends StatelessWidget {
  const CustomBottomSheetSource({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData colorTheme = GetThemData.getColorThemData(context);
    final TextTheme textTheme = GetThemData.getTextThemData(context);
    final height = context.height;
    return Container(
      clipBehavior: .antiAlias,
      padding: const EdgeInsetsDirectional.all(AppPadding.p8),
      decoration: BoxDecoration(
        color: colorTheme.secondaryHeaderColor,
        borderRadius: BorderRadiusDirectional.circular(AppBorderRadius.r16),
      ),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        spacing: 8,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(AppBorderRadius.r8),
            child: Image.asset(
              "assets/images/Rectangle 2.png",
              height: height * 0.2,
              width: double.infinity,
              fit: .fill,
            ),
          ),
          Text(
            "40-year-old man falls 200 feet to his death while canyoneering at national park40-year-old man falls 200 feet to his death while canyoneering at national park",
            style: textTheme.bodyMedium?.copyWith(
              color: colorTheme.primaryColor
            ),
            maxLines: 5,
            overflow: .ellipsis,
            textAlign: .start,
          ),
          const SizedBox(height: 8,),
          const CustomButtonApp(),
          const SizedBox(height: 8,),
        ],
      ),
    );
  }
}
