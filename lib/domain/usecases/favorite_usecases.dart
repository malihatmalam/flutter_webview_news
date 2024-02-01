import 'package:dartz/dartz.dart';
import 'package:flutter_webview_news/data/models/favorite/favorite.dart';
import 'package:flutter_webview_news/data/repositories/favorite_repo_impl.dart';
import 'package:hive/hive.dart';

import '../failures/failures.dart';

class FavoriteUseCases {
  final favoriteLocalRepo = FavoriteRepoImpl();

  Future<Either<Failure, List<Favorite>>> getListFavorite() async{
    return favoriteLocalRepo.getFavorite();
  }

  void storeFavorite({
    required title,
    required url,
  }){
    Box favorite = favoriteLocalRepo.getFavoriteData();
    favorite.add(Favorite(title, url));

  }

  void deletedFavorite({required key}) async {
    Box favorite = favoriteLocalRepo.getFavoriteData();
    await favorite.delete(key);
  }

}
