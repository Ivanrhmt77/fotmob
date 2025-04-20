import 'package:flutter/material.dart';
import 'package:fotmob/models/article_response.dart';
import 'package:fotmob/services/client.dart';
import 'package:fotmob/utils/time_utils.dart';
import 'package:fotmob/widgets/article_widgets.dart';
import 'package:fotmob/screens/articles/detail_article_page.dart';
import 'package:fotmob/utils/slide_page_route.dart';

class ArticleLatest extends StatefulWidget {
  const ArticleLatest({super.key});

  @override
  State<ArticleLatest> createState() => _ArticleLatestState();
}

class _ArticleLatestState extends State<ArticleLatest> {
  List<Article> listArticle = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getListArticle();
  }

  Future<void> getListArticle() async {
    setState(() {
      isLoading = true;
    });

    try {
      listArticle = await Client.fetchArticle("Football FIFA");
      print("Artikel berhasil dimuat: ${listArticle.length} item.");
    } catch (e) {
      print("Error loading articles: $e");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: listArticle.length,
                    itemBuilder: (context, index) {
                      final article = listArticle[index + 10];
                      return _buildArticleLarge(article);
                    },
                  ),
        ),
      ),
    );
  }

  Widget _buildArticleLarge(Article article) {
    return Column(
      children: [
        ArticleLarge(
          imageUrl: article.urlToImage,
          title: article.title,
          time: timeAgo(article.publishedAt),
          source: article.source,
          onTap: () => _navigateToDetailArticle(context, article),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  void _navigateToDetailArticle(BuildContext context, Article article) {
    Navigator.push(
      context,
      SlidePageRoute(
        page: DetailArticlePage(article: article),
        direction: AxisDirection.right,
      ),
    );
  }
}
