import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_border_radius.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_padding.dart';
import 'package:news_app/core/utils/app_text_styles.dart';

class AppThem {
  static ThemeData lightThem= ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme:AppBarTheme(
        backgroundColor: AppColors.white,
        titleTextStyle: AppTextStyles.style20mB,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.black,
          size: 24,
          fill: 24,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColors.black,
          size: 24,
          fill: 24,
        ),
      ),
      tabBarTheme: TabBarThemeData(
        dividerColor: Colors.transparent,
        unselectedLabelStyle: AppTextStyles.style16bB.copyWith(
            fontSize: 14,
            fontWeight: .w500
        ),
        labelStyle: AppTextStyles.style16bB,
        unselectedLabelColor:AppColors.black,
        labelColor: AppColors.black,
        indicator: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(AppBorderRadius.r8),
        ),
        indicatorColor: AppColors.black,
        tabAlignment: .start,
      ),
      textTheme: TextTheme(
          headlineLarge:AppTextStyles.style30bW,
          headlineMedium: AppTextStyles.style24bW,
          headlineSmall: AppTextStyles.style24mB,

          titleLarge:AppTextStyles.style24mB,
          titleMedium:AppTextStyles.style20bB,
          titleSmall: AppTextStyles.style20mB,

          bodyMedium: AppTextStyles.style16bB,
          labelSmall: AppTextStyles.style12mG
      ),
    useMaterial3: true,
    dividerTheme: DividerThemeData(
      color: AppColors.white,
      indent: AppPadding.p16,
      endIndent: AppPadding.p16,
      thickness: 2,
      radius: BorderRadiusDirectional.circular(AppBorderRadius.r8)
    ),
  );
  static ThemeData darkThem= ThemeData(
    scaffoldBackgroundColor: AppColors.black,
      appBarTheme:AppBarTheme(
        backgroundColor: AppColors.black,
        titleTextStyle: AppTextStyles.style20mW,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.white,
          size: 24,
          fill: 24,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColors.white,
          size: 24,
          fill: 24,
        ),
      ),
    tabBarTheme: TabBarThemeData(
      dividerColor: Colors.transparent,
      unselectedLabelStyle: AppTextStyles.style16bW.copyWith(
        fontSize: 14,
          fontWeight: .w500
      ),
      labelStyle: AppTextStyles.style16bW,
      unselectedLabelColor:AppColors.white,
      labelColor: AppColors.white,
      indicator: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppBorderRadius.r8),
      ),
      indicatorColor: AppColors.white,
      tabAlignment: .start,
    ),
    textTheme: TextTheme(
      headlineLarge:AppTextStyles.style30bB,
      headlineMedium: AppTextStyles.style24bB,
      headlineSmall: AppTextStyles.style24mW,

      titleLarge:AppTextStyles.style24mW,
      titleMedium:AppTextStyles.style20bW,
      titleSmall: AppTextStyles.style20mW,

      bodyMedium: AppTextStyles.style16bW,
      labelSmall: AppTextStyles.style12mG

    ),
    useMaterial3: true,
    dividerTheme: DividerThemeData(
        color: AppColors.white,
        indent: AppPadding.p16,
        endIndent: AppPadding.p16,
        thickness: 2,
        radius: BorderRadiusDirectional.circular(AppBorderRadius.r8)
    ),
  );
}