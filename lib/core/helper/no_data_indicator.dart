import 'package:flutter/material.dart';

class NoDataIndicator extends StatelessWidget {
  const NoDataIndicator({super.key, this.msg = "data"});
  final String? msg;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme= Theme.of(context).textTheme;
    return Center(child: Text("Not Found $msg",style:textTheme.titleMedium,));
  }
}
