
import 'package:equatable/equatable.dart';
class NewsEntity extends Equatable {
  final String title;
  final String image;
  final String url;

  NewsEntity({
    required this.title, required this.image, required this.url
  });


  factory NewsEntity.fromJson(Map<String, dynamic> json){
    return NewsEntity(
      title: json['title'] ?? 'Tidak ada judul',
      image: json['urlToImage'] ?? 'https://dinahosting.com/blog/upload/2021/03/error-404.jpg',
      url: json['url'] ?? 'Tidak ada judul',
    );
  }

  Map<String, dynamic> toJson() => {
    "title": title,
    "url": url,
    "image": image,
  };

  @override
  List<Object?> get props => [title, image, url];

  String toString() {
    return 'NewsModel{title: ${title}, url: ${url}, image: ${image}';
  }

}