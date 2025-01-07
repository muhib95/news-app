import 'package:flutter/material.dart';
import 'package:newsapps/model/news_model.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel newsModel;

  const NewsDetails({super.key, required this.newsModel});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.newsModel.title.toString(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.newsModel.urlToImage.toString(),
              height: 250,
              width: double.infinity,
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    widget.newsModel.source!.name.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  widget.newsModel.publishedAt.toString(),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Written By: ' + widget.newsModel.author.toString(),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.newsModel.title.toString(),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.newsModel.description.toString(),
            ),
            SizedBox(
              height: 8,
            ),
            Center(
              child: ElevatedButton(onPressed: () {

              }, child: Text('Read more...')),
            )
          ],
        ),
      ),
    );
  }
}
