import 'dart:convert';

import 'package:flutter_webview_news/domain/entities/news_entity.dart';
import 'package:http/http.dart' as http;

import '../exceptions/exceptions.dart';
import '../models/News/news_model.dart';

abstract class NewsApiRemoteDatasource{
  Future<List<NewsEntity>> getRamdonNewsFromApi();
}

class NewsApiRemoteDatasourceImpl implements NewsApiRemoteDatasource{
  final client = http.Client();

  @override
  Future<List<NewsEntity>> getRamdonNewsFromApi() async {
    final response = await client.get(
      Uri.parse('https://newsapi.org/v2/everything?q=keyword&apiKey=e0b270b68fc34e42956e8d8d206302ee'),
      headers: {
        'accept': 'application/json ',
      },
    );
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body)['articles'];
      // print(responseBody[0]);
      List<NewsEntity> listNews = (responseBody as List<dynamic>).map((news) => NewsEntity.fromJson(news as Map<String, dynamic>)).toList();
      // print(listNews[0]);
      return listNews;
    }
  }
}