import 'package:flutter/material.dart';
import 'package:newsapps/model/news_model.dart';
import 'package:newsapps/service/api_service.dart';

import '../components/news_item_list.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiService.getAllNews(),
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
