

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/detail_news_page/detail_page.dart';
import '../../pages/home_page/home_page.dart';

class RouterNavigation{

  RouterConfig<Object> getRoute(){
    return GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
              path: '/',
              name: 'index',
              builder: (context, state) => HomePage(),
          ),
          GoRoute(
            path: '/detail',
            name: 'listFavorite',
            builder: (context, state) => DetailNewPage( url: state.extra!.toString()),
          ),
        ]
    );
  }
}

