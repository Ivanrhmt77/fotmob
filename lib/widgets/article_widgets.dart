import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fotmob/models/article_response.dart';
import 'package:fotmob/utils/colors.dart';

class ArticleLarge extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final Source source;
  final VoidCallback? onTap;

  const ArticleLarge({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.source,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.black26,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                  errorWidget: (context, url, error) => SizedBox.shrink(),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    source.name,
                    style: const TextStyle(fontSize: 13, color: AppColors.gray),
                  ),
                  Text(
                    " · ",
                    style: const TextStyle(fontSize: 13, color: AppColors.gray),
                  ),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 13, color: AppColors.gray),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleSmall extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final Source source;
  final VoidCallback? onTap;

  const ArticleSmall({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.source,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.black26,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 150,
                  height: 80,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => SizedBox(
                        width: 150,
                        height: 80,
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                  errorWidget: (context, url, error) => SizedBox.shrink(),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          source.name,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.gray,
                          ),
                        ),
                        Text(
                          " · ",
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.gray,
                          ),
                        ),
                        Text(
                          time,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.gray,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
