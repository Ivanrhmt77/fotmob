import 'package:flutter/material.dart';
import 'package:fotmob/models/article_response.dart';
import 'package:fotmob/services/client.dart';
import 'package:fotmob/utils/colors.dart';
import 'package:fotmob/utils/time_utils.dart';
import 'package:fotmob/widgets/article_widgets.dart';
import 'package:fotmob/screens/detail_article_page.dart';
import 'package:fotmob/utils/slide_page_route.dart';

class ArticleForYouPage extends StatefulWidget {
  const ArticleForYouPage({super.key});

  @override
  State<ArticleForYouPage> createState() => _ArticleForYouPageState();
}

class _ArticleForYouPageState extends State<ArticleForYouPage> {
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
      listArticle = await Client.fetchArticle("Soccer");
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
                      final article = listArticle[index];

                      if (index == 0) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.local_fire_department,
                                  color: AppColors.green,
                                  size: 22,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "Sedang Tren",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            _buildArticleLarge(article),
                          ],
                        );
                      } else if (index > 0 && index <= 4) {
                        return _buildArticleSmall(article);
                      } else if (index == 5) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.people_alt,
                                  color: AppColors.green,
                                  size: 22,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "Yang anda ikuti",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            _buildArticleLarge(article),
                          ],
                        );
                      } else if (index > 5 && index <= 9) {
                        return _buildArticleSmall(article);
                      } else if (index == 10) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time_filled,
                                  color: AppColors.green,
                                  size: 22,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "Terbaru",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            _buildArticleLarge(article),
                          ],
                        );
                      } else {
                        return _buildArticleLarge(article);
                      }
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

  Widget _buildArticleSmall(Article article) {
    return Column(
      children: [
        ArticleSmall(
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
