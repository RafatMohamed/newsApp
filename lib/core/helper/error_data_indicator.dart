import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_text.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key, this.msg});
  final String? msg;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Center(
      child: Text(
        msg == null ? AppText.errorNowSource : msg!,
        style: textTheme.titleMedium,
      ),
    );
  }
}
