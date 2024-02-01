

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'cubit/favorite_cubit.dart';

class FavoritePageWrapperProvider extends StatelessWidget {
  const FavoritePageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(),
      child: const IndexPage(),
    );
  }
}

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var listPenduduk = PendudukUseCases().getAllPenduduk();
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(2),
              // height: 400,
              child: BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  if(state is FavoriteInitial){
                    return Text('Sedang ambil data');
                  } else if (state is FavoriteLoading) {
                    return CircularProgressIndicator();
                  } else if (state is FavoriteLoaded) {
                    var listFavorite = state.favorite;
                    return ListView(
                      children: List.generate(listFavorite.length, (index) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: ListTile(
                            onTap: () {
                              context.go('/detail/', extra: listFavorite[index].url);
                            },
                            title: Text('${listFavorite[index].title}'),
                            // title: Text('test'),
                            trailing:
                            IconButton(onPressed: () {
                              context.go('/detail/', extra: listFavorite[index].url);
                            }, icon: Icon(Icons.arrow_forward)),
                            style: ListTileStyle.list,
                          ),
                        );
                      }),
                    );
                  } else if (state is FavoriteError) {
                    return Center(
                      child: Text('Error = ${state.message}'),
                    );
                  } return const SizedBox();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}