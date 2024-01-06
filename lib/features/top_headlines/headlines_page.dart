import 'package:flutter/material.dart';
import 'package:news_app/config/network/network_request.dart';
import 'package:news_app/features/top_headlines/headline_model.dart';
///DATA PRINT GARXA TAKING FROM NETWORK REQUEST
class HeadlinePage extends StatefulWidget {
  const HeadlinePage({super.key});

  @override
  State<HeadlinePage> createState() => _HeadlinePageState();
}

class _HeadlinePageState extends State<HeadlinePage> {
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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          child: Padding(

                            padding: const EdgeInsets.all(4.0),
                            child:
                            SingleChildScrollView(
                              child: Column(
                              
                                children: [
                                  Text(result[index].title?? " ",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 19),),

                                  Image.network(result[index].urlToImage?? " ",width: 800,height: 300,),
                                  Text(result[index].description?? " ",style: TextStyle(fontSize: 17),),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text('Author:', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                                      Text(result[index].author?? "Unknown", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                                    ],
                                  ),
                              
                                ],
                              ),
                            ),

                          )),
                    );
                  }
                );
              }
              else if(snapshot.hasError){
                return Center(child: Text('Error fetching data') );
              }

              return CircularProgressIndicator();
            })



          ],
        )
    ) ;

  }
}
