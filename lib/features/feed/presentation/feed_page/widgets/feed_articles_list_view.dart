import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_feed/features/feed/data/models/feed.dart';
import 'package:github_feed/features/feed/presentation/feed_page/widgets/article_tile.dart';
import 'package:github_feed/features/feed/presentation/widgets/sliver_fill_remaining_loading.dart';
import 'package:github_feed/features/feed/state/feed/feed_cubit.dart';

class ArticlesListView extends StatelessWidget {
  const ArticlesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final feedState = context.watch<FeedCubit>().state;

    return feedState.maybeWhen(
      loaded: (feed) => LoadedArticlesView(feed: feed),
      failure: (feed) => feed == null ? const FailureArticlesView() : LoadedArticlesView(feed: feed),
      loading: (feed) => feed == null ? const SliverFillRemainingLoading() : LoadedArticlesView(feed: feed),
      orElse: () => const SliverFillRemainingLoading(),
    );
  }
}

class LoadedArticlesView extends StatelessWidget {
  final Feed feed;
  const LoadedArticlesView({required this.feed, super.key});

  @override
  Widget build(BuildContext context) {
    if (feed.articles.isEmpty) {
      return const EmptyArticlesView();
    }

    return SliverList.separated(
      itemCount: feed.articles.length,
      itemBuilder: (_, i) => ArticleTile(article: feed.articles[i]),
      separatorBuilder: (context, index) => const Divider(indent: 15),
    );
  }
}

class FailureArticlesView extends StatelessWidget {
  const FailureArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Text('Could not load feed links'),
      ),
    );
  }
}

class EmptyArticlesView extends StatelessWidget {
  const EmptyArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text('No articles found'),
      ),
    );
  }
}
