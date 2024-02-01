

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/news_page/news_page.dart';

class RouterNavigation{

  RouterConfig<Object> getRoute(){
    return GoRouter(
        initialLocation: '/',
        routes: [
          // GoRoute(
          //     path: '/',
          //     name: 'index',
          //     builder: (context, state) => HomePage(),
          // ),
          GoRoute(
            path: '/',
            name: 'index',
            builder: (context, state) => HomeNewsPageWrapperProvider(),
          // ),
          // GoRoute(
          //   path: '/list-favorite',
          //   name: 'listFavorite',
          //   builder: (context, state) => ListNewsFavoritePageWrapperProvider(),
          // // ),
          // GoRoute(
          //   path: '/detail/:url',
          //   name: 'listFavorite',
          //   builder: (context, state) {
          //     var url = state.pathParameters['url'];
          //     return DetailNewPage(url);
          //   },
          ),
        ]
    );
  }

}

