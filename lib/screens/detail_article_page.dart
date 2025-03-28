import 'package:flutter/material.dart';
import 'package:fotmob/models/article_response.dart';

class DetailArticlePage extends StatelessWidget {
  final Article article;

  const DetailArticlePage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Berita")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            article.urlToImage,
            fit: BoxFit.cover,
          ), // Gambar tidak ada padding
          const SizedBox(height: 10), // Jarak antara gambar dan teks
          Padding(
            padding: const EdgeInsets.all(10), // Padding hanya untuk teks
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text("Published: ${article.publishedAt}"),
                const SizedBox(height: 10),
                Text(article.content),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
