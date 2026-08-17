import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_text.dart';

class NoDataIndicator extends StatelessWidget {
  const NoDataIndicator({super.key, this.msg = "data"});
  final String? msg;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme= Theme.of(context).textTheme;
    return Center(child: Text(AppText.noSource,style:textTheme.titleMedium,));
  }
}
