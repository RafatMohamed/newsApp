import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_text.dart';
import '../../../../core/utils/app_padding.dart';
import 'custom_bottom_sheet_source.dart';
import 'custom_item_sourve.dart';
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
      children: [
        CustomTabBarSources(
          listSource: list,
          onTapSource: (tabIndex) {
            if (tabIndex == currentIndex) return;
            currentIndex = tabIndex;
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Expanded(
              child: ListView.separated(
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const CustomBottomSheetSource();
                        },
                      );
                    },
                    child: const CustomItemSource(),
                  );
                },
                separatorBuilder: (_, _) => const SizedBox(height: 16),
                itemCount: 5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
