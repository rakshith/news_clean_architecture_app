import 'package:flutter/material.dart';
import 'package:news_clean_arch_app/core/failures_successes/exceptions.dart';
import 'package:news_clean_arch_app/core/services_locator.dart';
import 'package:news_clean_arch_app/features/show_news/data/data_sources/fetch_from_remote_ds.dart';
import 'package:news_clean_arch_app/features/show_news/data/models/articels_model.dart';
import 'package:news_clean_arch_app/features/show_news/domain/entities/articles.dart';
import 'package:news_clean_arch_app/core/failures_successes/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:news_clean_arch_app/features/show_news/domain/repositories/fetch_repo_contract.dart';

class FetchRepoImpl implements FetchRepo {
  // final FetchFromRemoteDS fetchFromRemoteDS = sl<FetchFromRemoteDS>();
  final FetchFromRemoteDS fetchFromRemoteDS;

  FetchRepoImpl(this.fetchFromRemoteDS);

  @override
  Future<Either<Failure, List<ArticlesModel>>> fetchNews(String? searchText) async {
    try {
      return Right(await fetchFromRemoteDS.fetchNews(searchText));
    } on FetchException catch (e) {
      return Left(FetchFailure(message: e.message));
    }
  }
}
