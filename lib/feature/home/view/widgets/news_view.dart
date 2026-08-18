import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/core/helper/error_data_indicator.dart';
import 'package:news_app/core/helper/loading_data_indicator.dart';
import 'package:news_app/core/helper/no_data_indicator.dart';
import 'package:news_app/core/model/articalsModel/articles_item_model.dart';
import 'package:news_app/core/model/articalsModel/articles_model.dart';
import 'package:news_app/core/model/sourcesModel/source_model.dart';
import 'package:news_app/core/model/sourcesModel/sources_item_model.dart';
import 'package:news_app/core/services/api/api_services.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/feature/home/view/widgets/custom_item_sourve.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/utils_app_helper.dart';
import 'custom_bottom_sheet_source.dart';
import 'custom_tab_bar.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key, required this.categoriesId});
  final String categoriesId;
  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int currentIndex = 0;
  ScrollController scrollController = ScrollController();

  late Future<SourceModel> sourcesResult;
  Future<ArticlesModel>? articalesResult;

  List<SourcesItemModel> sourceItemList = [];
  List<ArticlesItemsModel> articalesItemList = [];

  bool isLoading = false;
  bool isMoreArticales = true;

  int page = 1;
  int pageSize = 5;

  @override
  void initState() {
    sourcesResult = ApiServices.getSources(widget.categoriesId);
    scrollController.addListener(loadingMoreArticales);
    super.initState();
  }

  Future<void> loadingMoreArticales() async {
    if (!scrollController.hasClients) return;

    final position = scrollController.position;

    if (position.pixels >= position.maxScrollExtent - 200) {
      await loadMoreArticales();
    }
  }

  Future<void> loadMoreArticales() async {
    try {
      if (isLoading || !isMoreArticales) return;
      setState(() {
        isLoading = true;
      });
      final int newPage = page + 1;
      final ArticlesModel articalesResultNew = await ApiServices.getArticals(
        sourceID: sourceItemList[currentIndex].id ?? "",
        page: newPage,
        pageSize: pageSize,
      );
      final List<ArticlesItemsModel>? articalesItemListnew =
          articalesResultNew.articles ?? [];
      if (articalesItemListnew!.isEmpty) {
        isLoading = false;
        isMoreArticales = false;
        setState(() {});
        return;
      }
      articalesItemList.addAll(articalesItemListnew);
      isLoading = false;
      final int totalResult = articalesResultNew.totalResults?.toInt() ?? 0;
      isMoreArticales = articalesItemList.length < totalResult;
      page = newPage;
      setState(() {});
    } catch (e) {
      isLoading = false;
      setState(() {});
      rethrow;
    }
  }

  void getFirstPage() {
    page = 1;
    isLoading = false;
    isMoreArticales = true;
    articalesItemList.clear();
    articalesResult = ApiServices.getArticals(
      sourceID: sourceItemList[currentIndex].id ?? "",
      page: page,
      pageSize: pageSize,
    );
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textThem = GetThemData.getTextThemData(context);
    final ThemeData colorThem = GetThemData.getColorThemData(context);
    return FutureBuilder(
      future: sourcesResult,
      builder: (context, snapShot) {
        sourceItemList = snapShot.data?.sources ?? [];
        if (snapShot.connectionState == .waiting) {
          return const LoadingIndicator();
        }
        if (snapShot.hasError || snapShot.data?.status != "ok") {
          return ErrorIndicator(msg: AppText.errorNowSource);
        }
        if (!snapShot.hasData) {
          return NoDataIndicator(msg: AppText.noSource);
        }
        articalesResult ??= ApiServices.getArticals(
          sourceID: sourceItemList[currentIndex].id ?? "",
          pageSize: pageSize,
          page: page,
        );
        return sourceItemList.isNotEmpty
            ? Column(
                children: [
                  CustomTabBarSources(
                    listSource: sourceItemList,
                    onTapSource: (tabIndex) {
                      if (tabIndex == currentIndex) return;
                      currentIndex = tabIndex;
                      getFirstPage();
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.p16),
                      child: FutureBuilder(
                        future: articalesResult,
                        builder: (context, snapShot) {
                          if (snapShot.connectionState == .waiting) {
                            return LoadingIndicator();
                          }
                          if (snapShot.hasError ||
                              snapShot.data?.status != "ok") {
                            return ErrorIndicator(
                              msg: AppText.errorNowArticles,
                            );
                          }
                          if (!snapShot.hasData) {
                            return NoDataIndicator(
                              msg: AppText.noArticlesFound,
                            );
                          }
                          if (articalesItemList.isEmpty) {
                            articalesItemList = snapShot.data?.articles ?? [];
                          }

                          if (articalesItemList.isEmpty) {
                            return NoDataIndicator(
                              msg: AppText.noArticlesFound,
                            );
                          }
                          if (articalesItemList.isNotEmpty) {
                            return Column(
                              children: [
                                Expanded(
                                  child: ListView.separated(
                                    controller: scrollController,
                                    itemBuilder: (_, index) {
                                      return InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return CustomBottomSheetSource(
                                                articles:
                                                    articalesItemList[index],
                                              );
                                            },
                                          );
                                        },
                                        child: CustomItemSource(
                                          articles: articalesItemList[index],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (_, _) =>
                                        const SizedBox(height: 16),
                                    itemCount:
                                        articalesItemList.length +
                                        (isLoading ? 1 : 0),
                                  ),
                                ),
                                if (isLoading) Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: .spaceEvenly,
                                    children: [
                                      Text(
                                        AppText.isLoading,
                                        style: textThem.bodyMedium,
                                      ),
                                      LoadingIndicator(),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return NoDataIndicator(
                              msg: AppText.noArticlesFound,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              )
            : NoDataIndicator(msg: AppText.notFoundNews);
      },
    );
  }
}
