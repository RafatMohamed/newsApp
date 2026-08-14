import 'package:flutter/material.dart';

class CustomTabBarSources extends StatelessWidget {
  const CustomTabBarSources({
    super.key,
    required this.listSource,
    required this.onTapSource,
  });

  final List<String> listSource;
  final ValueChanged<int> onTapSource;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: listSource.length,
      child: TabBar(
        onTap: (tabIndex) {
          onTapSource(tabIndex);
        },
        isScrollable: true,
        padding: const EdgeInsetsDirectional.only(start: 16),
        tabs: listSource.map((source) => Tab(text: source)).toList(),
      ),
    );
  }
}
