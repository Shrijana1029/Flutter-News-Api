import 'package:flutter/material.dart';
import 'package:news_app/features/top_headlines/headline_model.dart';
import 'package:news_app/features/top_headlines/headlines_page.dart';
import 'package:news_app/features/top_headlines/news_card.dart';
import 'package:news_app/features/top_headlines/news_datails.dart';


class NewsPage extends StatefulWidget {
  const NewsPage({super.key});


  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(bottom: TabBar(
        controller: _tabController,
        tabs: [
          Tab(icon: Icon(Icons.directions_car),),
          Tab(icon: Icon(Icons.directions_transit),),
          Tab(icon: Icon(Icons.directions_bike),),

        ],
      ),
        title: Text('News App',
        ),
      ),
      body: TabBarView(
        controller: _tabController,

        children: [
          HeadlinePage(),
          // NewsDetails(result: result)
          // NewsCard(result: Articles),
          Icon(Icons.directions_bike),



        ],

      ),
    );
  }
}
