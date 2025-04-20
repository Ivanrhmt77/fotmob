import 'package:flutter/material.dart';
import 'package:fotmob/models/article_response.dart';
import 'package:fotmob/services/client.dart';
import 'package:fotmob/utils/time_utils.dart';
import 'package:fotmob/widgets/article_widgets.dart';
import 'package:fotmob/screens/articles/detail_article_page.dart';
import 'package:fotmob/utils/slide_page_route.dart';

class ArticleLeagues extends StatefulWidget {
  const ArticleLeagues({super.key});

  @override
  State<ArticleLeagues> createState() => _ArticleLeaguesState();
}

class _ArticleLeaguesState extends State<ArticleLeagues> {
  List<Article> premierLeague = [];
  List<Article> laliga = [];
  List<Article> bundesliga = [];
  List<Article> ligue1 = [];
  List<Article> serieA = [];
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
      premierLeague = await Client.fetchArticle("Premier League Football");
      laliga = await Client.fetchArticle("Laliga Barcelona Real Madrid");
      bundesliga = await Client.fetchArticle("Bundesliga Bayern Munchen");
      ligue1 = await Client.fetchArticle("Ligue 1 PSG Football");
      serieA = await Client.fetchArticle(
        "Serie A Inter milan Juventus Football",
      );

      print("Artikel berhasil dimuat");
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
                  : ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildLeagueSection(
                        leagueName: "Premier League",
                        leagueImageUrl:
                            'https://play-lh.googleusercontent.com/pJPgV--7ICYdqOyd6_8pgVXx9jIa81_YNLKI532jiGa9xBMZJarKRzgj76oYXUO7zK8',
                        articles: premierLeague,
                      ),
                      _buildLeagueSection(
                        leagueName: "La Liga",
                        leagueImageUrl:
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/LaLiga_logo_2023.svg/1200px-LaLiga_logo_2023.svg.png',
                        articles: laliga,
                      ),
                      _buildLeagueSection(
                        leagueName: "Bundesliga",
                        leagueImageUrl:
                            'https://cdn.brandfetch.io/bundesliga.com/fallback/lettermark/theme/dark/h/256/w/256/icon?c=1bfwsmEH20zzEfSNTed',
                        articles: bundesliga,
                      ),
                      _buildLeagueSection(
                        leagueName: "Ligue 1",
                        leagueImageUrl:
                            'https://upload.wikimedia.org/wikipedia/commons/f/fb/Ligue1_logo.png',
                        articles: ligue1,
                      ),
                      _buildLeagueSection(
                        leagueName: "Serie A",
                        leagueImageUrl:
                            'https://play-lh.googleusercontent.com/9cNj8ixTiQx1g0hvrQ8Sh52suPWLEY0m0NZ5SfzsFfFqqGCzP2LfaY-FDl1jBKTOuSWs',
                        articles: serieA,
                      ),
                    ],
                  ),
        ),
      ),
    );
  }

  Widget _buildLeagueSection({
    required String leagueName,
    required String leagueImageUrl,
    required List<Article> articles,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.network(leagueImageUrl, width: 22, height: 22),
            const SizedBox(width: 10),
            Text(
              leagueName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 10),
        _buildArticleLarge(articles[0]),
        _buildArticleSmall(articles[1]),
        _buildArticleSmall(articles[2]),
        _buildArticleSmall(articles[3]),
        _buildArticleSmall(articles[4]),
      ],
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
