import 'package:flutter/material.dart';
import 'package:fotmob/utils/colors.dart';
import 'package:fotmob/widgets/article_widgets.dart';
import 'package:fotmob/screens/not_found_page.dart';
import 'package:fotmob/utils/slide_page_route.dart';

class ArticleForYouPage extends StatelessWidget {
  const ArticleForYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ArticleLarge(
                imageUrl:
                    "https://static01.nyt.com/athletic/uploads/wp/2024/08/14094915/GettyImages-2165865551-scaled.jpg",
                title: "Menjelajahi Keindahan Alam",
                time: "90 min · 1 jam lalu",
                onTap: () => _navigateToNotFound(context),
              ),
              const SizedBox(height: 20),
              ArticleSmall(
                imageUrl:
                    "https://static01.nyt.com/athletic/uploads/wp/2024/08/14094915/GettyImages-2165865551-scaled.jpg",
                title: "Teknologi Masa Depan",
                time: "90 min · 1 jam lalu",
                onTap: () => _navigateToNotFound(context),
              ),
              const SizedBox(height: 20),
              ArticleLarge(
                imageUrl:
                    "https://static01.nyt.com/athletic/uploads/wp/2024/08/14094915/GettyImages-2165865551-scaled.jpg",
                title: "Arsitektur Modern",
                time: "90 min · 1 jam lalu",
                onTap: () => _navigateToNotFound(context),
              ),
              const SizedBox(height: 20),
              ArticleSmall(
                imageUrl:
                    "https://static01.nyt.com/athletic/uploads/wp/2024/08/14094915/GettyImages-2165865551-scaled.jpg",
                title: "Perkembangan Dunia Olahraga ",
                time: "90 min · 1 jam lalu",
                onTap: () => _navigateToNotFound(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.darkGray,
      title: const Text("Artikel Untukmu"),
    );
  }

  void _navigateToNotFound(BuildContext context) {
    Navigator.push(
      context,
      SlidePageRoute(
        page: const NotFoundPage(),
        direction: AxisDirection.right,
      ),
    );
  }
}
