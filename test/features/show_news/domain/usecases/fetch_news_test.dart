import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_clean_arch_app/core/failures_successes/failures.dart';
import 'package:news_clean_arch_app/core/services_locator.dart';
import 'package:news_clean_arch_app/features/show_news/domain/entities/articles.dart';
import 'package:news_clean_arch_app/features/show_news/domain/repositories/fetch_repo_contract.dart';
import 'package:news_clean_arch_app/features/show_news/domain/usecases/fetch_news.dart';

import 'fetch_news_test.mocks.dart';

final GetIt sl = GetIt.instance;

Articles article1 = Articles(publishedAt: DateTime.now());

@GenerateMocks([FetchRepo])
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServices();

  MockFetchRepo mockFetchRepo;
  FetchNewsUsecase fetchNewsUseCase;

  mockFetchRepo = MockFetchRepo();
  fetchNewsUseCase = FetchNewsUsecase(mockFetchRepo);

  test('should fetch news from the repository', () async {
    when(fetchNewsUseCase.fetchNews('world'))
        .thenAnswer((_) async => Right([article1]));

    final Either<Failure, List<Articles>> fetchNewsResult =
        await fetchNewsUseCase.fetchNews('world');

    expect(fetchNewsResult.length(), 1);
  });
}
