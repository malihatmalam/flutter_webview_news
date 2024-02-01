

import 'package:dartz/dartz.dart';
import 'package:flutter_webview_news/data/datasource/news_api_remote_datasource.dart';
import 'package:flutter_webview_news/data/exceptions/exceptions.dart';
import 'package:flutter_webview_news/domain/entities/news_entity.dart';
import 'package:flutter_webview_news/domain/failures/failures.dart';
import 'package:flutter_webview_news/domain/repositories/news_repo.dart';


class NewsRepoImpl implements NewsRepo {
  final NewsApiRemoteDatasource newsApiRemoteDatasource =
  NewsApiRemoteDatasourceImpl();

  @override
  Future<Either<Failure, List<NewsEntity>>> getNewsFromDatasource() async {
    try{
      final result = await newsApiRemoteDatasource.getRamdonNewsFromApi();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      print(e);
      return left(GeneralFailure());
    }
  }


}