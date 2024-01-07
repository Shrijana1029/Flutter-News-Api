import 'package:flutter/material.dart';

import 'headline_model.dart';

class NewsCard extends StatelessWidget {
  NewsCard({required this.result,super.key});

  Articles result;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //////TITLE
            Text(
              result.title ?? " ",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
            ),
            /////PHOTO
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  result.urlToImage ?? " ",
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return SizedBox.shrink();
                  },
                  width: 800,
                  height: 300,
                )),
            Text(
              result.description ?? "You can explore!!!!!!!!",
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 17),
            ),
            // SizedBox(height: 20),

            Row(
              children: [
                /////AUTHOR
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Author:",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: result.author ?? " ",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 120),

              ],
            ),
          ],
        ),
      ),
    ));
  }
}
