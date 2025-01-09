import 'package:flutter/material.dart';
import 'package:github_feed/core/extensions/datetime_extensions.dart';
import 'package:github_feed/features/feed/data/models/article.dart';

class ArticleTile extends StatelessWidget {
  final Article article;

  const ArticleTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(article.published.yyyyMMddHHmm, style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: 2),
          Text(
            article.title.trim(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
