import 'package:flutter/material.dart';
import 'package:news_clean_arch_app/core/constants/const.dart';
import 'package:news_clean_arch_app/core/failures_successes/exceptions.dart';
import 'package:news_clean_arch_app/core/services/api_service.dart';
import 'package:news_clean_arch_app/core/services_locator.dart';
import 'package:news_clean_arch_app/features/show_news/data/models/articels_model.dart';

abstract class FetchFromRemoteDS {
  Future<List<ArticlesModel>> fetchNews(String? searchText);
}

class FetchFromRemoteDSImpl implements FetchFromRemoteDS {
  // final ApiService apiService = sl<ApiService>();
  final ApiService apiService;

  FetchFromRemoteDSImpl({required this.apiService});

  @override
  Future<List<ArticlesModel>> fetchNews(String? searchText) async {
    try {
      Map<String, dynamic> json = await apiService.getData(
        searchText != null ? Const.apiEverything : Const.apiTopHeadLines,
        {
          'apiKey': Const.apiKey,
          if (searchText == null) 'country': 'us',
          if (searchText != null) 'q': searchText,
        },
      );

      List list = json['articles'];

      List<Map<String, dynamic>> mapList = [];

      for (int i = 0; i < list.length; i++) {
        Map<String, dynamic> map = list[i] as Map<String, dynamic>;
        mapList.add(map);
      }

      List<ArticlesModel> articles = [];

      for (int i = 0; i < mapList.length; i++) {
        ArticlesModel articlesModel = ArticlesModel.fromJson(mapList[i]);
        articles.add(articlesModel);
      }

      return articles;
    } catch (e) {
      print('error: ${e.toString()}');
      throw const FetchException(message: 'Failed to get data');
    }
  }
}
