import 'package:flutter/material.dart';
import 'package:newsapps/model/news_model.dart';

class NewsItemList extends StatelessWidget {
  final NewsModel newsModel;
  const NewsItemList({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Image.network(newsModel.urlToImage.toString(),height: 250,width: double.infinity,),
          Row(
            children: [
              Container(
                child: Text(newsModel.source!.name.toString(),style: TextStyle(color: Colors.white),),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.red,borderRadius: BorderRadius.circular(30),
                ),
              ),

              SizedBox(width: 8,),
              Text(newsModel.publishedAt.toString(),),
              
            ],
          ),
          SizedBox(height: 4,),
          Text('Written By: '+newsModel.author.toString()),
          SizedBox(height: 4,),
          Text(newsModel.title.toString()),
          

        ],
      ),
    );
  }
}
