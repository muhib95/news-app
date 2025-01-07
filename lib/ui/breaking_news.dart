import 'package:flutter/material.dart';
import 'package:newsapps/components/news_item_list.dart';
import 'package:newsapps/model/news_model.dart';
import 'package:newsapps/service/api_service.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiService.getBrakingNews(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<NewsModel> articleList = snapshot.data ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
            return NewsItemList(newsModel: articleList[index],);
          },
            itemCount: articleList.length,

          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },

    );
  }
}
