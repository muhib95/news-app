import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapps/model/news_model.dart';

class ApiService {
  final all_news_url="https://newsapi.org/v2/everything?q=bitcoin&apiKey=d20e7ec1dde04a04b02b7b85f73a1284";
  final breaking_news="https://newsapi.org/v2/top-headlines?country=us&apiKey=d20e7ec1dde04a04b02b7b85f73a1284";
  Future<List<NewsModel>> getAllNews()async{
    try{
      Response response=await get(Uri.parse(all_news_url));
      if(response.statusCode==200){
        Map<String,dynamic> json=jsonDecode(response.body);
        List<dynamic> body=json['articles'];
        List<NewsModel> articlesList=body.map((item)=>NewsModel.fromJson(item)).toList();
        return articlesList;

      }
      else{
        throw ('No News Found');
      }

    }
    catch(e){
      throw e;
    }
  }
  Future<List<NewsModel>> getBrakingNews() async{
    try{
      Response response=await get(Uri.parse(breaking_news));
      print(response.statusCode);
      if(response.statusCode==200){
        Map<String,dynamic> json=jsonDecode(response.body);

        List<dynamic> body=json['articles'];

        List<NewsModel> articlesList=body.map((item)=>NewsModel.fromJson(item)).toList();
        print(articlesList);
        return articlesList;
      }
      else{
        throw ('No news found');

      }
    }catch(e){
      print(e.toString());
      throw e;

    }


  }



}