import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.msg});
  final String? msg;
  @override
  Widget build(BuildContext context) {
    final ThemeData  colorThem = Theme.of(context);
    return Center(
      child: CircularProgressIndicator(
        color:colorThem.secondaryHeaderColor,
        constraints: const BoxConstraints(
           maxHeight: 30,
          minHeight: 20,
          maxWidth: 30,
          minWidth: 20
        ),
      ),
    );
  }
}
