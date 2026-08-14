import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/core/utils/utils_app_helper.dart';
import 'package:provider/provider.dart';

import '../../../../core/logic/providers/localization.dart';
import '../../../../core/logic/providers/them_provider.dart';
import 'custom_tab_bar.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> list = [
      AppText.business,
      AppText.entertainment,
      AppText.general,
      AppText.health,
      AppText.science,
      AppText.sport,
      AppText.technology,
      AppText.business,
      AppText.entertainment,
      AppText.general,
      AppText.health,
      AppText.science,
      AppText.sport,
      AppText.technology,
    ];

    return Column(
      children:[
        CustomTabBarSources(
          listSource: list,
          onTapSource: (tabIndex) {
            if (tabIndex == currentIndex) return;
            currentIndex = tabIndex;
          },
        ),
        Column(

        ),
      ],
    );
  }
}

