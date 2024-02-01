
import 'package:dartz/dartz.dart';
import 'package:flutter_webview_news/data/datasource/data_local_datasource.dart';
import 'package:flutter_webview_news/domain/failures/failures.dart';
import 'package:hive/hive.dart';

import '../models/favorite/favorite.dart';

class FavoriteRepoImpl {
  final DataLocalDataSourceImpl dataLocalDataSourceImpl =
  DataLocalDataSourceImpl();

  Box<Favorite> getFavoriteData(){
    return dataLocalDataSourceImpl.getDataFavoriteLocal();
  }

  List<Favorite> getAllFavorite(){
    List<Favorite> listFavorite = dataLocalDataSourceImpl.getDataFavoriteLocal().values.toList();
    return listFavorite;
  }

  Future<Either<Failure, List<Favorite>> >getFavorite() async {
    try{
      final result = await getAllFavorite();
      return right(result);
    } catch (e) {
      return left(GeneralFailure());
    }

  }

}