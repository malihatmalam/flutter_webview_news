import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_webview_news/domain/entities/news_entity.dart';
import 'package:flutter_webview_news/domain/failures/failures.dart';
import 'package:flutter_webview_news/domain/usecases/news_usecases.dart';

part 'news_state.dart';

const generalFailureMessage = 'Ups, something gone wrong. Please try again!';
const serverFailureMessage = 'Ups, API Error. please try again!';
const cacheFailureMessage = 'Ups, chache failed. Please try again!';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial()){
    newsRequested();
  }

  final NewsUseCases newsUseCases = NewsUseCases();

  void newsRequested() async {
    emit(NewsStateLoading());
    final failureOrNews = await newsUseCases.getNews();
    failureOrNews.fold(
            (failure) => emit(NewsStateError(message: _mapFailureToMessage(failure))),
            (news) => emit(NewsStateLoaded(news: news))
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
