import 'package:dartz/dartz.dart';
import 'package:news_clean_arch_app/core/failures_successes/failures.dart';
import 'package:news_clean_arch_app/features/show_news/domain/entities/articles.dart';

abstract class FetchRepo {
  Future<Either<Failure, List<Articles>>> fetchNews(String? searchText);
}
