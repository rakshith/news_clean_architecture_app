part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {
  final List<Articles> articles;
  NewsInitial({required this.articles});
}

class NewsInitialSearch extends NewsState {
  final List<Articles> articles;
  NewsInitialSearch({required this.articles});
}

class NewsLoading extends NewsState {}

class NewsError extends NewsState {}
