import 'package:flutter_webview_news/data/models/favorite/favorite.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DataLocalDataSourceImpl{
  DataLocalDataSourceImpl(){
    openBox();
  }

  void openBox() async {
    Hive.initFlutter();
    await Hive.openBox('favorite');
  }

  Box getDataLocal() {
    final box = Hive.box('favorite');
    return box;
  }

  Box<Favorite> getDataFavoriteLocal() {
    final box = Hive.box<Favorite>('favorite');
    return box;
  }
}