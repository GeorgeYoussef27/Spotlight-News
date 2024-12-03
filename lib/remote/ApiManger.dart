import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotlight_news/model/ArticlesResponse/ArticlesResponse.dart';
import 'package:spotlight_news/model/SourcesResponse/SourcesResponse.dart';
import 'package:spotlight_news/remote/constants.dart';
class ApiManger {


  static Future<SourcesResponse?> getSources(String category) async {
    try {
      Uri url = Uri.https(baseUrl, sourcesEndpoint, {
        "category": category,
        "apiKey": apiKey
      });
      var response = await http.get(url);
      Map<String,dynamic> json = jsonDecode(response.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch(error){

    }
  }
  static Future<ArticlesResponse?> getAtricles(String sourceId)async{
    //
    try{
      Uri url = Uri.https(baseUrl,articlesEndpoint,{
        "apiKey":apiKey,
        "sources":sourceId
      });
      var response = await http.get(url);
      Map<String,dynamic> json = jsonDecode(response.body);
      var articlesResponse = ArticlesResponse.fromJson(json);
      return articlesResponse;
    }catch(error){

    }
  }
}