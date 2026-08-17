import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/core/helper/loading_data_indicator.dart';
import 'package:news_app/generated/assets.dart';

class CustomImageAppWidget extends StatelessWidget {
  const CustomImageAppWidget({
    super.key,
    required this.pathImage,
    required this.height,
  });

  final String pathImage;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: pathImage,
      height: height * 0.22,
      width: double.infinity,
      fit: .fill,
      progressIndicatorBuilder: (context, url, progress) {
        return const LoadingIndicator();
      },
      alignment: .center,
      errorWidget: (context, url, error) {
        return Image.asset(
          Assets.images.sport.path,
          height: height * 0.22,
          width: double.infinity,
          fit: .fill,
        );
      },
    );
  }
}
