import 'package:flutter/material.dart';
import 'package:news_app/core/helper/error_data_indicator.dart';
import 'package:news_app/core/model/articalsModel/articles_item_model.dart';
import 'package:news_app/core/widgets/custom_button_app.dart';
import 'package:news_app/core/widgets/custom_widget_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/app_border_radius.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/utils_app_helper.dart';

class CustomBottomSheetSource extends StatefulWidget {
  const CustomBottomSheetSource({super.key, required this.articles});
  final ArticlesItemsModel articles;

  @override
  State<CustomBottomSheetSource> createState() => _CustomBottomSheetSourceState();
}

class _CustomBottomSheetSourceState extends State<CustomBottomSheetSource> {
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
            child: CustomImageAppWidget(
              pathImage: widget.articles.urlToImage!,
              height: height,
            ),
          ),
          Text(
            widget.articles.title!,
            style: textTheme.bodyMedium?.copyWith(
              color: colorTheme.primaryColor,
            ),
            maxLines: 5,
            overflow: .ellipsis,
            textAlign: .start,
          ),
          const SizedBox(height: 8),
          CustomButtonApp(
            onTap: () {
              launchUrlGoToWebsite();
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Future<void> launchUrlGoToWebsite() async {
    final String? url = widget.articles.url;
    if (url == null) {
      if(!mounted)return;
      ScaffoldMessenger.of(context,).showSnackBar(
          const SnackBar(content: ErrorIndicator(),padding: EdgeInsetsDirectional.symmetric(horizontal: AppPadding.p16),behavior: .floating,),snackBarAnimationStyle: AnimationStyle(
        duration: const Duration(milliseconds: 500),
        curve: CatmullRomCurve(const [])
      ));
      return;
    }
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: .inAppBrowserView)) {
      if(!mounted)return;
      ScaffoldMessenger.of(context,).showSnackBar(
          const SnackBar(content: ErrorIndicator(),padding: EdgeInsetsDirectional.symmetric(horizontal: AppPadding.p16),behavior: .floating,),snackBarAnimationStyle: AnimationStyle(
          duration: const Duration(milliseconds: 500),
          curve: CatmullRomCurve(const [])
      ));
      throw Exception('Could not launch $url');
    }
  }
}
