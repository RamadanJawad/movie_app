import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/resources/manager_colors.dart';
import 'package:movie_app/core/resources/manager_size_util.dart';
import 'package:movie_app/features/search/presentation/controller/search_controller.dart';

class CustomSearchDelegate extends SearchDelegate {
  SearchController searchController = SearchController();
  @override
  ThemeData appBarTheme(BuildContext context) => Theme.of(context);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.grey : Theme.of(context).accentColor,
        ),
        onPressed: query.isEmpty ? null : () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Icon(
        CupertinoIcons.left_chevron,
        color: ManagerColors.white,
        size: ManagerHeight.h22,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchController.showResult(query);
    return GetBuilder<SearchController>(builder: (controller) {
      if (query.isNotEmpty) {
        return ListView.builder(itemBuilder: (context, index) {
          return Container();
        });
      }
      return Center(
        child: Text("Enter Word"),
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
