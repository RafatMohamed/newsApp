import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/feature/drawer/view/widgets/custom_drawer_view.dart';
import 'package:news_app/feature/home/models/categories_model.dart';
import 'package:news_app/feature/home/view/widgets/categories_view.dart';
import 'package:news_app/feature/home/view/widgets/news_view.dart';
import 'package:news_app/feature/search/view/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CategoriesModel? categories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categories == null ? AppText.home : categories!.name),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      drawer: CustomDrawerView(onTapRest: restCategories),
      body: categories == null
          ? CategoriesView(
              onTapCategories: (categoriesModel) {
                onTapCategories(categoriesModel);
              },
            )
          : NewsView(categoriesId: categories!.id),
    );
  }

  void restCategories() {
    if (categories == null) return;
    setState(() {
      categories = null;
    });
  }

  void onTapCategories(CategoriesModel categoriesModel) {
    setState(() {
      categories = categoriesModel;
    });
  }
}
