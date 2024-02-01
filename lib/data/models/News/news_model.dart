

import 'package:equatable/equatable.dart';
import 'package:flutter_webview_news/domain/entities/news_entity.dart';

class NewsModel extends NewsEntity with EquatableMixin {
  NewsModel(
      {required String title, required String image, required String url }
      )
      : super(title: title, image: image, url: url);

  factory NewsModel.fromJson(Map<String, dynamic> json){
    return NewsModel(
        title: json['title'] ?? 'Tidak ada judul',
        image: json['urlToImage'] ?? 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fsalonlfc.com%2Fimage-not-found%2F&psig=AOvVaw2CCmW8xOf7gLJnpJWC41a6&ust=1706889127120000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOj75te_ioQDFQAAAAAdAAAAABAD',
        url: json['url'] ?? 'Tidak ada judul',
    );
  }

}