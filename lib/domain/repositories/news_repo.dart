

import 'package:dartz/dartz.dart';
import 'package:flutter_webview_news/domain/entities/news_entity.dart';

import '../failures/failures.dart';

abstract class NewsRepo {
  Future<Either<Failure, List<NewsEntity>>> getNewsFromDatasource();
}