import 'package:flutter/material.dart';
import 'package:news_clean_arch_app/core/constants/palette.dart';
import 'package:news_clean_arch_app/features/show_news/domain/entities/articles.dart';

class NewsViewPage extends StatelessWidget {
  final Articles article;
  const NewsViewPage({super.key, required this.article});

  String _getDateInDDMMYYFormat(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Palette.deepBlue,
            size: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title != null ? article.title! : '-- NO Title --',
                style: const TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 300,
                color: Palette.lightGrey,
                child: article.urlToImage != null
                    ? Image.network(article.urlToImage!, fit: BoxFit.cover)
                    : const SizedBox(),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                _getDateInDDMMYYFormat(article.publishedAt),
                style: const TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                article.author != null ? article.author! : '-- No Author --',
                style: const TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                article.description != null
                    ? article.description!
                    : '-- NO Description --',
                style: const TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
