import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_clean_arch_app/features/show_news/domain/entities/articles.dart';
import 'package:news_clean_arch_app/features/show_news/domain/usecases/fetch_news.dart';
import 'package:news_clean_arch_app/features/show_news/presentation/news_cubit/news_cubit.dart';

import 'news_cubit_test.mocks.dart';

@GenerateMocks([FetchNewsUsecase])
void main() {
  group('News bloc test', () {
    late NewsCubit newsCubit;

    late MockFetchNewsUsecase mockFetchNewsUsecase;

    setUp(() {
      mockFetchNewsUsecase = MockFetchNewsUsecase();
      newsCubit = NewsCubit(mockFetchNewsUsecase);
    });

    final tArticle = Articles(
      author: 'test author',
      title: 'test title',
      description: 'test description',
      url: 'test url',
      urlToImage: 'test url to image',
      publishedAt: DateTime.parse('2022-01-01T02:15:39Z'),
      content: 'test content',
    );

    blocTest<NewsCubit, NewsState>(
        'Should  [NewsLoading, NewsInitial] states for fetch news api',
        build: () {
          when(mockFetchNewsUsecase.fetchNews(any))
              .thenAnswer((_) async => Right([tArticle]));

          return NewsCubit(mockFetchNewsUsecase);
        },
        act: (bloc) => bloc.fetchNews('world'),
        expect: () => [
              NewsLoading(),
              NewsInitialSearch(articles: [tArticle])
            ],
        verify: (bloc) {
          verify(mockFetchNewsUsecase.fetchNews('world'));
        });

    tearDown(() {
      newsCubit.close();
    });
  });
}
