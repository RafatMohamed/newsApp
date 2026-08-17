import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_border_radius.dart';
import '../utils/app_padding.dart';
import '../utils/utils_app_helper.dart';

class CustomShimmerLoadingArticles extends StatelessWidget {
  const CustomShimmerLoadingArticles({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData colorTheme = GetThemData.getColorThemData(context);
    final height =context.height;
    return Shimmer(
      gradient: LinearGradient(colors: [
        AppColors.gray,
        colorTheme.secondaryHeaderColor,
        colorTheme.primaryColor,
        colorTheme.secondaryHeaderColor,
        AppColors.gray,
      ],end: .bottomEnd,begin: .topStart),
      direction: ShimmerDirection.ttb,
      enabled: true,
      child: Container(
        height: height*0.4,
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
      ),
    );
  }
}
