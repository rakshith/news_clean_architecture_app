import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_clean_arch_app/core/failures_successes/failures.dart';
import 'package:news_clean_arch_app/core/services_locator.dart';
import 'package:news_clean_arch_app/features/show_news/data/data_sources/fetch_from_remote_ds.dart';
import 'package:news_clean_arch_app/features/show_news/data/models/articels_model.dart';
import 'package:news_clean_arch_app/features/show_news/data/repositories/fetch_repo_impl.dart';
import 'package:news_clean_arch_app/features/show_news/domain/entities/articles.dart';

import 'fetch_repo_impl_test.mocks.dart';

ArticlesModel article1 = ArticlesModel(publishedAt: '2/3/2023');

@GenerateMocks([FetchFromRemoteDS])
void main() {
  MockFetchFromRemoteDS mockFetchFromRemoteDS;
  FetchRepoImpl fetchRepoImpl;

  mockFetchFromRemoteDS = MockFetchFromRemoteDS();
  fetchRepoImpl = FetchRepoImpl(mockFetchFromRemoteDS);

  test('should fetch news from the repository', () async {
    when(mockFetchFromRemoteDS.fetchNews('world'))
        .thenAnswer((_) async => [article1]);

    // final Either<Failure, List<Articles>> fetchNewsResult =
    //     await fetchRepoImpl.fetchNews('world');
    // final result = await fetchRepoImpl.fetchNews('world');

    // expect(result, equals(Right(result)));
  });
}
