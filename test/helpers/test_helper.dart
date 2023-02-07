import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:news_clean_arch_app/core/services/api_service.dart';

@GenerateMocks([ApiService], customMocks: [MockSpec<Dio>(as: #MockDio)])
void main() {}
