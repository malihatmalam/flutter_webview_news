import 'package:hive/hive.dart';

part 'favorite.g.dart';

@HiveType(typeId: 0)
class Favorite extends HiveObject{

  @HiveField(0)
  String title;

  @HiveField(1)
  String url;

  Favorite(
      this.title,
      this.url,
      );
}