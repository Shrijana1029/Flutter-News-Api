import 'package:flutter/material.dart';
import 'package:news_app/features/top_headlines/headline_model.dart';

import 'news_card.dart';

class NewsDetails extends StatefulWidget {
  NewsDetails({required this.result,super.key});
  Articles result;
  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News Details')),
      body: ListView(
       children: [
         NewsCard(result: widget.result),
         SizedBox(height: 12),
         Text(widget.result.content ?? " ",maxLines: 20,),
         SizedBox(height: 8),
         TextButton(onPressed: (){

         }, child: Text(widget.result.url ?? " "))
       ],

      ),


    );
  }
}
