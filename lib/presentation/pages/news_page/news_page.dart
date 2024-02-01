import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webview_news/presentation/pages/news_page/cubit/news_cubit.dart';
import 'package:flutter_webview_news/presentation/pages/news_page/widget/error_message.dart';
import 'package:go_router/go_router.dart';

class HomeNewsPageWrapperProvider extends StatelessWidget {
  const HomeNewsPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: const HomeNewsPage(),
    );
  }
}

class HomeNewsPage extends StatelessWidget {
  const HomeNewsPage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if(state is NewsInitial){
            return Text('Sedang ambil data');
          } else if(state is NewsStateLoading){
            return Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text('Sedang ambil data')
                  ],
                )
            );
          } else if(state is NewsStateLoaded) {
            var listNews = state.news;
            // print(listNews);
            return  ListView(
              children: List.generate(listNews.length, (index) {
                return Container(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5,bottom: 10),
                          height: 150,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Image.network(
                                '${listNews[index].image}',
                                height: 140,
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 10.0,
                                right: 20.0,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 40.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              context.go('/detail/', extra: listNews[index].url);
                              // context.go('/detail/${listNews[index].url}');
                            },
                            child: Text(
                              '${listNews[index].title}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(50),
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                )
                            )),
                      ],
                    )
                );
              }),
            );
          } else if (state is NewsStateError){
            return ErrorMessage(message: state.message);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
