import 'package:flutter/material.dart';
import 'package:flutter_webview_news/data/models/favorite/favorite.dart';
import 'package:flutter_webview_news/presentation/core/router/router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(FavoriteAdapter());
  await Hive.openBox<Favorite>('favorite');

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter News',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: RouterNavigation().getRoute(),
      debugShowCheckedModeBanner: false,
    );
  }
}
