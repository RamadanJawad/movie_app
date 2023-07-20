import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movie_app/features/search/api/search_request.dart';
import 'package:movie_app/features/search/api/search_response.dart';

class SearchController extends GetxController {
  SearchResponse? searchResponse;
  TextEditingController searchController = TextEditingController();
  List<Search> searchResult = [];

  void showResult(String word) async {
    searchResponse = await SearchRequest().getResult(word);
    searchResult = searchResponse!.results!;
    update();
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<SearchController>();
  }
}
