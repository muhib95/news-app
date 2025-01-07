import 'package:flutter/material.dart';
import 'package:newsapps/ui/all_news.dart';
import 'package:newsapps/ui/breaking_news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('News App'),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(text: 'Breaking News',),
            Tab(text: 'All News',),
          ]),
        ),
        body: TabBarView(children: [
          BreakingNews(),
          AllNews(),
        ]),


      ),
    );
  }
}
