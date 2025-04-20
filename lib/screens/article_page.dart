import 'package:flutter/material.dart';
import 'package:fotmob/screens/article_for_you_page.dart';
import 'package:fotmob/screens/article_latest.dart';
import 'package:fotmob/screens/not_found_page.dart';
import 'package:fotmob/utils/colors.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: const TabBarView(
          children: [ArticleForYouPage(), ArticleLatest(), NotFoundPage()],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.darkBlackGray,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Berita",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            IconButton(
              icon: const Icon(Icons.tune),
              onPressed: () => _showBottomSheet(context),
              iconSize: 18,
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Theme(
          data: Theme.of(context).copyWith(
            tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TabBar(
              indicatorColor: AppColors.green,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: AppColors.lightGray,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
              unselectedLabelColor: AppColors.gray,
              tabs: const [
                Tab(text: "Untuk Anda"),
                Tab(text: "Terbaru"),
                Tab(text: "Liga"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.blackGray,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: const Center(
            child: Text("Filter", style: TextStyle(fontSize: 18)),
          ),
        );
      },
    );
  }
}
