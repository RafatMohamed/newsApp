import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/utils/app_padding.dart';
import '../../../../core/utils/app_border_radius.dart';
import '../../../../core/utils/utils_app_helper.dart';
import 'custom_drop_down_lang.dart';
import 'custom_drop_down_them.dart';

class CustomItemDrawer extends StatelessWidget {
  const CustomItemDrawer({
    super.key,
    required this.title,
    required this.iconPath,
    this.islanguageWidget=false,
    this.withWidget=true,
  });

  final String title;
  final String iconPath;
  final bool islanguageWidget;
  final bool withWidget;

  @override
  Widget build(BuildContext context) {
    final ThemeData colorThem = GetThemData.getColorThemData(context);
    final TextTheme textThem = GetThemData.getTextThemData(context);
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                colorThem.secondaryHeaderColor,
                .srcIn,
              ),
              fit: .scaleDown,
            ),
            const SizedBox(width: 16),
            Text(title, style: textThem.titleMedium),
          ],
        ),
        Visibility(
          visible: withWidget,
          child: Container(
            margin: const EdgeInsetsDirectional.only(
              top: AppPadding.p16
            ),
            clipBehavior: .antiAlias,
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: AppPadding.p16,
            ),
            decoration: BoxDecoration(
              color: colorThem.primaryColor,
              borderRadius: BorderRadius.circular(AppBorderRadius.r16),
              border: Border.all(color: colorThem.secondaryHeaderColor),
            ),
            child:islanguageWidget? Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(title, style: textThem.titleSmall),
                const CustomDropDownLanguage(),
              ],
            ): Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(title, style: textThem.titleSmall),
                const CustomDropDownThem(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


