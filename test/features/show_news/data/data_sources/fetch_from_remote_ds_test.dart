import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_clean_arch_app/core/services/api_service.dart';
import 'package:news_clean_arch_app/features/show_news/data/data_sources/fetch_from_remote_ds.dart';
import 'package:news_clean_arch_app/features/show_news/data/models/articels_model.dart';

import '../../../../dummy_data/article_everything_data.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  const API_KEY = '77704dee5f0f4ac09fcc7b9d8ab3d17f';
  const BASE_URL = 'https://newsapi.org/v2/everything';
  const COUNTRY = 'id';
  const pageSize = 20;

  late MockApiService mockApiService;
  late FetchFromRemoteDSImpl dataSource;

  setUp(() {
    mockApiService = MockApiService();
    dataSource = FetchFromRemoteDSImpl(apiService: mockApiService);
  });

  test('should test fetch news from api service and return successfull data',
      () async {
    when(
      mockApiService.getData(any, any),
    ).thenAnswer((_) async => Future.value(articel1));

    List<ArticlesModel> result = await dataSource.fetchNews('world');

    final actualArticle = [result[0].toJson()];

    expect(actualArticle, articel1['articles']);
  });
}
