import 'package:flutter/material.dart';
import 'package:news_app/config/network/network_request.dart';
import 'package:news_app/features/top_headlines/headline_model.dart';
import 'package:news_app/features/top_headlines/news_card.dart';
import 'package:news_app/features/top_headlines/news_datails.dart';
import 'package:url_launcher/url_launcher.dart';
///DATA PRINT GARXA TAKING FROM NETWORK REQUEST
class HeadlinePage extends StatefulWidget {
  const HeadlinePage({super.key});


  @override
  State<HeadlinePage> createState() => _HeadlinePageState();
}

class _HeadlinePageState extends State<HeadlinePage> {
  static Future<void> launchCaller({required String actionMsg}) async {
    if (!await launchUrl(Uri.parse(actionMsg))) {
      throw Exception('Could not launch $actionMsg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "Flutter", style: TextStyle(color: Colors.black,fontSize:26,fontWeight: FontWeight.bold)),
              TextSpan(text: " News", style: TextStyle(color: Colors.blue,fontSize:26,fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      )
      ),

        body: ListView(
          children: [

            FutureBuilder<List<Articles>?>
              (future: NetworkRequest().getTopHeading(), builder: (context,snapshot){
              if(snapshot.hasData)
              {
                var result = snapshot.data ?? [];
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: result.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index) {

                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsDetails(
                          result: result[index],
                        )
                        )
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        NewsCard(result: result[index],
                        ),

                      ),
                    );
                  }
                );
              }
              else if(snapshot.hasError){
                return Center(child: Text('Error fetching data') );
              }

              return CircularProgressIndicator();
            }),



          ],
        )

    ) ;


  }
}

