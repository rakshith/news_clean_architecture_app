import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:news_clean_arch_app/core/failures_successes/failures.dart';
import 'package:news_clean_arch_app/core/services_locator.dart';
import 'package:news_clean_arch_app/features/show_news/domain/entities/articles.dart';
import 'package:news_clean_arch_app/features/show_news/domain/usecases/fetch_news.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  // final FetchNewsUsecase _fetchNewsUsecase = sl<FetchNewsUsecase>();
  final FetchNewsUsecase fetchNewsUsecase;
  NewsCubit(this.fetchNewsUsecase) : super(NewsInitial(articles: const []));

  void fetchNews(String? searchText) async {
    emit(NewsLoading());

    final Either<Failure, List<Articles>> fetchNewsResult =
        await fetchNewsUsecase.fetchNews(searchText);

    fetchNewsResult.fold(
        (l) => {emit(NewsError())},
        (news) => {
              if (searchText != null)
                {emit(NewsInitialSearch(articles: news))}
              else
                {emit(NewsInitial(articles: news))}
            });
  }
}
