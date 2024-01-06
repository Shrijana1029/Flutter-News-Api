import 'package:dio/dio.dart';
import 'package:news_app/config/network/api_endpoints.dart';
import 'package:news_app/features/top_headlines/headline_model.dart';
///requests the heaadline_modal for data
class NetworkRequest{
  final dio = Dio();
  ///http request garna GET POST DELETE PATCH

  Future<List<Articles>?> getTopHeading() async {
    final response = await dio.get(ApiEndpoints.topHeadlines);
    if(response.statusCode ==200 || response.statusCode ==201)
      {
        ///success
       return HeadlineModel.fromJson(response.data).articles; /// AGI KO DATA HARU AUXA
      }
    else{
      ////failure
    }
    print("News Response");
    print(response);
  }

}