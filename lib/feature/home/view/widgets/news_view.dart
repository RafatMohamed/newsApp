import 'package:flutter/material.dart';
import 'package:news_app/core/helper/custom_shimmer_loading_articles.dart';
import 'package:news_app/core/helper/error_data_indicator.dart';
import 'package:news_app/core/helper/loading_data_indicator.dart';
import 'package:news_app/core/helper/no_data_indicator.dart';
import 'package:news_app/core/model/articalsModel/articles_item_model.dart';
import 'package:news_app/core/model/sourcesModel/sources_item_model.dart';
import 'package:news_app/core/services/api/api_services.dart';
import 'package:news_app/feature/home/view/widgets/custom_item_sourve.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/app_padding.dart';
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
  late var sourcesResult =ApiServices.getSources(widget.categoriesId);
 
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: sourcesResult,
      builder: (context, snapShot) {
        final List<SourcesItemModel>? sourceItem=  snapShot.data?.sources;
        if(snapShot.connectionState==.waiting){
          return const LoadingIndicator();
        }
        if(snapShot.hasError ||snapShot.data?.status!="ok"){
          return const ErrorIndicator(msg: "error now Source",);
        }
        if(!snapShot.hasData){
          return const NoDataIndicator(msg: "no source",);
        }
        return sourceItem!=null? Column(
          children: [
            CustomTabBarSources(
              listSource: sourceItem,
              onTapSource: (tabIndex) {
                if (tabIndex == currentIndex) return;
                currentIndex = tabIndex;
                setState(() {});
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child:  FutureBuilder(
                  future: ApiServices.getArticals(sourceItem[currentIndex].id??"bbc-news"),
                  builder: (context, snapShot) {
                    final List<ArticlesItemsModel>? articalsItems=  snapShot.data?.articles;
                    if(snapShot.connectionState==.waiting){
                      return const CustomShimmerLoadingArticles();
                    //  return const LoadingIndicator();
                    }
                    if(snapShot.hasError ||snapShot.data?.status!="ok"){
                      return const ErrorIndicator(msg: "error now Articals",);
                    }
                    if(!snapShot.hasData){
                      return const NoDataIndicator(msg: "no source",);
                    }
                    return articalsItems!=null? Skeletonizer(
                      enabled:snapShot.connectionState==.waiting,
                      enableSwitchAnimation: true,
                      effect: const PulseEffect(),
                      child: ListView.separated(
                        itemBuilder: (_, index) {
                          return InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return  CustomBottomSheetSource(
                                    articles: articalsItems[index],
                                  );
                                },
                              );
                            },
                            child:  CustomItemSource(articles: articalsItems[index]),
                          );
                        },
                        separatorBuilder: (_, _) => const SizedBox(height: 16),
                        itemCount: articalsItems.length,
                      ),
                    ):const NoDataIndicator(msg: "no articals Found",);
                  }
                ),
              ),
            ),
          ],
        ) :const NoDataIndicator(msg: "not Found News",);
      }
    );
  }
}
