import 'package:flutter/material.dart';
import 'package:news_clean_arch_app/core/constants/palette.dart';
import 'package:news_clean_arch_app/features/show_news/domain/entities/articles.dart';
import 'package:news_clean_arch_app/features/show_news/presentation/pages/news_view_page.dart';

class NewsCard extends StatelessWidget {
  final Articles article;
  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NewsViewPage(
            article: article,
          );
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: 300,
        width: MediaQuery.of(context).size.width - (2 * 16),
        child: Stack(
          children: [
            Container(
              height: 260,
              color: Palette.lightGrey,
              child: article.urlToImage != null
                  ? Image.network(article.urlToImage!, fit: BoxFit.cover)
                  : const SizedBox(),
            ),
            Positioned(
                left: 16,
                right: 16,
                bottom: 0,
                child: Container(
                  height: 80,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 4)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        article.title != null
                            ? article.title!
                            : '-- No Title --',
                        maxLines: 2,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Palette.deepBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
