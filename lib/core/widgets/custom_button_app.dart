import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_text.dart';

import '../utils/app_border_radius.dart';
import '../utils/app_padding.dart';
import '../utils/utils_app_helper.dart';

class CustomButtonApp extends StatelessWidget {
  const CustomButtonApp({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    final ThemeData colorTheme = GetThemData.getColorThemData(context);
    final TextTheme textTheme = GetThemData.getTextThemData(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: .infinity,
        alignment: .center,
        padding: const EdgeInsetsDirectional.all(AppPadding.p16),
        decoration: BoxDecoration(
          color:colorTheme.primaryColor,
          borderRadius: BorderRadiusDirectional.circular(AppBorderRadius.r8),
        ),
        child: Text(AppText.viewFullArticel,style: textTheme.bodyMedium,),
      ),
    );
  }
}
