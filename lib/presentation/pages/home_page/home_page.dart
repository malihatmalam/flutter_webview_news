

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

          )
        ],
      ),
    );
  }
}
