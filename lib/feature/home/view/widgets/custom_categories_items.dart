import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/utils/app_border_radius.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/feature/home/models/categories_model.dart';
import 'package:news_app/generated/assets.dart';

import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/utils_app_helper.dart';

class CustomCategoriesItems extends StatelessWidget {
  const CustomCategoriesItems({
    super.key,
    required this.categoriesItem,
    required this.index,
  });
  final CategoriesModel categoriesItem;
  final int index;
  @override
  Widget build(BuildContext context) {
    final double width = context.width;
    final double height = context.height;
    final ThemeData colorThem = GetThemData.getColorThemData(context);
    final TextTheme textThem = GetThemData.getTextThemData(context);
    final bool isEven = index.isEven;
    final double getAngle = isEven?0/360: 1080/360;
     return Directionality(
       textDirection: .ltr,
       child: Container(
        height: height * 0.25,
        width: width,
        decoration: BoxDecoration(
          color: colorThem.secondaryHeaderColor,
          image: DecorationImage(
            image: AssetImage(categoriesItem.pathImage.toString()),
            alignment: isEven ? .centerStart : .centerEnd,
            fit: .contain
          ),
          borderRadius: BorderRadiusDirectional.circular(AppBorderRadius.r24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Column(
            crossAxisAlignment: isEven ? .end : .start,
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                categoriesItem.name,
                style: textThem.headlineLarge,
                textAlign: .start,
              ).tr(
                context: context,
              ),
              Container(
                padding: EdgeInsetsDirectional.only(
                  start: isEven ? AppPadding.p10 : 0,
                  end: !isEven ? AppPadding.p10 : 0,
                ),
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadiusDirectional.circular(100),
                ),
                child: Row(
                  mainAxisSize: .min,
                  textDirection:isEven? .ltr:.rtl,
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      AppText.viewAll,
                      style: textThem.headlineSmall,
                      textAlign: .start,
                    ),
                    const SizedBox(width: 8,),
                    Container(
                      width: 35,
                      height: 35,
                      alignment: .center,
                      decoration: BoxDecoration(
                        color: colorThem.primaryColor,
                        shape: .circle,
                      ),
                      child: Transform.rotate(
                        angle:getAngle,
                        alignment: .center,
                        child: SvgPicture.asset(
                          Assets.icons.arrow.path,
                          fit: .scaleDown,
                          alignment: .center,
                          colorFilter: ColorFilter.mode(colorThem.secondaryHeaderColor, .srcIn),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
           ),
     );
  }
}
