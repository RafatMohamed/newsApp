import 'package:flutter/material.dart';
import 'package:news_app/core/model/articalsModel/articles_model.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/core/widgets/custom_text_field.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/helper/error_data_indicator.dart';
import '../../../core/helper/no_data_indicator.dart';
import '../../../core/model/articalsModel/articles_item_model.dart';
import '../../../core/services/api/api_services.dart';
import '../../../core/utils/app_padding.dart';
import '../../home/view/widgets/custom_bottom_sheet_source.dart';
import '../../home/view/widgets/custom_item_sourve.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  Future<ArticlesModel>? articalsResult;

  void onSubmittedSearch(String query) {
    setState(() {
      if (query.trim().isEmpty) {
        articalsResult = null;
        return;
      } else {
        articalsResult = ApiServices.getArticalsOnSearch(
          query.trim().toString(),
        );
      }
    });
  }
  void clearSearch() {
    onSubmittedSearch("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16,vertical: AppPadding.p16),
              child: CustomTextField(
                onSubmitted: onSubmittedSearch,
                onClear: clearSearch,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: articalsResult == null
                    ? NoDataIndicator(msg: AppText.newsSearch)
                    : FutureBuilder(
                        future: articalsResult,
                        builder: (context, snapShot) {
                          final List<ArticlesItemsModel>? articalsItems = snapShot.data?.articles;
                          if (snapShot.hasError ||
                              snapShot.data?.status != "ok") {
                            return  ErrorIndicator(
                              msg: AppText.errorNowArticles,
                            );
                          }
                          if (!snapShot.hasData) {
                            return  NoDataIndicator(
                              msg: AppText.noArticlesFound,
                            );
                          }
                          return articalsItems != null
                              ? Skeletonizer(
                                  enabled: snapShot.connectionState == .waiting,
                                  enableSwitchAnimation: true,
                                  effect: const PulseEffect(),
                                  child: ListView.separated(
                                    itemBuilder: (_, index) {
                                      return InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return CustomBottomSheetSource(
                                                articles: articalsItems[index],
                                              );
                                            },
                                          );
                                        },
                                        child: CustomItemSource(
                                          articles: articalsItems[index],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (_, _) =>
                                        const SizedBox(height: 16),
                                    itemCount: articalsItems.length,
                                  ),
                                )
                              : NoDataIndicator(msg:AppText.noArticlesFound,);
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
