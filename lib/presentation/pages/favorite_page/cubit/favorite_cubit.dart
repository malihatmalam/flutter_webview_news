import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_webview_news/data/models/favorite/favorite.dart';
import 'package:flutter_webview_news/domain/usecases/favorite_usecases.dart';

import '../../../../domain/failures/failures.dart';

part 'favorite_state.dart';

const generalFailureMessage = 'Ups, something gone wrong. Please try again!';
const serverFailureMessage = 'Ups, API Error. please try again!';
const cacheFailureMessage = 'Ups, chache failed. Please try again!';

class FavoriteCubit extends Cubit<FavoriteState> {

  final FavoriteUseCases _favoriteUseCases = FavoriteUseCases();
  FavoriteCubit() : super(FavoriteInitial());

  void favoriteGetData() async {
    emit(FavoriteLoading());
    final failureOrFavorite = await _favoriteUseCases.getListFavorite();
    failureOrFavorite.fold(
            (failure) => emit(FavoriteError(message: _mapFailureToMessage(failure))),
            (favorite) => emit(FavoriteLoaded(favorite: favorite))
    );
  }

  String _mapFailureToMessage(Failure failure){
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
