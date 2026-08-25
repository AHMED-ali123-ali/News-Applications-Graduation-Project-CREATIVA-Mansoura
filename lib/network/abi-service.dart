import 'package:dio/dio.dart';

import '../model/articles.dart';

class Api {
  Dio dio = Dio();

  Future<List<Articles>> news(String value) async {
    Response response = await dio.get(
      'https://newsapi.org/v2/top-headlines?country=us&category=$value&apiKey=c33eb00f2a9f413f8a89befce038a012',
    );

    Map<String, dynamic> json = response.data;

    List<Articles> articles = [];

    for (var item in json['articles']) {
      articles.add(
        Articles(
          title: item['title'],
          description: item['description'],
          urlToImage: item['urlToImage'],
          url: item['url'],
        ),
      );
    }

    return articles;
  }
}