

import 'package:flutter/material.dart';
import 'package:flutter_webview_news/presentation/pages/favorite_page/favorite_page.dart';
import 'package:flutter_webview_news/presentation/pages/news_page/news_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('News BSI'),
          centerTitle: true,
          bottom: TabBar(
              tabs: [
                Tab(
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home),
                          Text('Home'),
                        ],
                      ),
                    )
                ),
                Tab(
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite),
                          Text('Favorite'),
                        ],
                      ),
                    )
                )
              ]
          ),
        ),
        body: TabBarView(
          children: [
            Scaffold(
              body: HomeNewsPageWrapperProvider(),
            ),
            Scaffold(
              body: FavoritePageWrapperProvider(),
            ),
          ],
        ),
      ),
    );
  }
}
