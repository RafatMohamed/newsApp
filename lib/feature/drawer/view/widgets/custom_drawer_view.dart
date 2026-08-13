import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/core/utils/utils_app_helper.dart';
import 'package:news_app/generated/assets.dart';
import '../../../../core/utils/app_border_radius.dart';
import '../../../../core/utils/app_padding.dart';
import 'custom_item_drawer.dart';

class CustomDrawerView extends StatelessWidget {
  const CustomDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = context.width;
    final double height = context.height;
    final ThemeData colorThem = GetThemData.getColorThemData(context);
    final TextTheme textThem = GetThemData.getTextThemData(context);
    return Container(
      width: width * 0.7,
      height: double.infinity,
      decoration: BoxDecoration(
        color: colorThem.primaryColor,
        borderRadius: BorderRadiusDirectional.circular(AppBorderRadius.r16),
      ),
      child: Column(
        children: [
          Container(
            height: height * 0.2,
            alignment: .center,
            clipBehavior: .antiAlias,
            decoration: BoxDecoration(
              color: colorThem.secondaryHeaderColor,
            ),
            child: Text(AppText.newsApp, style: textThem.headlineMedium),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              spacing: AppPadding.p24,
              children: [
                CustomItemDrawer(
                  title: AppText.goToHome,
                  iconPath: Assets.icons.home.path,
                  withWidget: false,
                ),
                const Divider(),
                CustomItemDrawer(
                  title: AppText.them,
                  iconPath: Assets.icons.themIcon.path,
                ),
                const Divider(),
                CustomItemDrawer(
                  title: AppText.language,
                  iconPath: Assets.icons.langIcon.path,
                  islanguageWidget: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

