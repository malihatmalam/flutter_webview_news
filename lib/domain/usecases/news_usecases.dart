

import 'package:dartz/dartz.dart';
import 'package:flutter_webview_news/data/repositories/news_repo_impl.dart';
import 'package:flutter_webview_news/domain/entities/news_entity.dart';

import '../failures/failures.dart';

class NewsUseCases {
  final newsRepo = NewsRepoImpl();

  Future<Either<Failure, List<NewsEntity>>> getNews() async {
    return newsRepo.getNewsFromDatasource();
  }
}