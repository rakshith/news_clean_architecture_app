import 'package:dartz/dartz.dart';
import 'package:news_clean_arch_app/core/failures_successes/failures.dart';
import 'package:news_clean_arch_app/core/services_locator.dart';
import 'package:news_clean_arch_app/features/show_news/domain/entities/articles.dart';
import 'package:news_clean_arch_app/features/show_news/domain/repositories/fetch_repo_contract.dart';

class FetchNewsUsecase {
  final FetchRepo fetchRepo = sl<FetchRepo>();
  

  Future<Either<Failure, List<Articles>>> fetchNews(String? searchText) {
    return fetchRepo.fetchNews(searchText);
  }
}
