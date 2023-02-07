import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_arch_app/core/constants/palette.dart';
import 'package:news_clean_arch_app/core/services_locator.dart';
import 'package:news_clean_arch_app/features/show_news/domain/usecases/fetch_news.dart';
import 'package:news_clean_arch_app/features/show_news/presentation/news_cubit/news_cubit.dart';
import 'package:news_clean_arch_app/features/show_news/presentation/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FetchNewsUsecase _fetchNewsUsecase = sl<FetchNewsUsecase>();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return NewsCubit(_fetchNewsUsecase);
        }),
      ],
      child: MaterialApp(
        title: 'News App ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme:
              const ColorScheme.light().copyWith(secondary: Palette.deepBlue),
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
