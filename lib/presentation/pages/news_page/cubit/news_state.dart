part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsStateLoading extends NewsState{}

class NewsStateLoaded extends NewsState{
  final List<NewsEntity> news;
  const NewsStateLoaded({required this.news});

  @override
  List<Object> get props => [news];
}

class NewsStateError extends NewsState{
  final String message;
  const NewsStateError({required this.message});

  @override
  List<Object> get props => [message];
}
