import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key, this.msg});
  final String? msg;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Center(
      child: Text(
        msg == null ? "Something Went Wrong" : msg!,
        style: textTheme.titleMedium,
      ),
    );
  }
}
