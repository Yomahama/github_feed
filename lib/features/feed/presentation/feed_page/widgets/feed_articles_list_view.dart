// ignore_for_file: unused_element

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
      loaded: (feed) => _LoadedArticlesView(feed: feed),
      failure: (feed) => feed == null ? const _FailureArticlesView() : _LoadedArticlesView(feed: feed),
      loading: (feed) => feed == null ? const SliverFillRemainingLoading() : _LoadedArticlesView(feed: feed),
      orElse: () => const SliverFillRemainingLoading(),
    );
  }
}

class _LoadedArticlesView extends StatelessWidget {
  final Feed feed;
  const _LoadedArticlesView({required this.feed, super.key});

  @override
  Widget build(BuildContext context) {
    if (feed.articles.isEmpty) {
      return const _EmptyArticlesView();
    }

    return SliverList.separated(
      itemCount: feed.articles.length,
      itemBuilder: (_, i) => ArticleTile(article: feed.articles[i]),
      separatorBuilder: (context, index) => const Divider(indent: 15),
    );
  }
}

class _FailureArticlesView extends StatelessWidget {
  const _FailureArticlesView({super.key});

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

class _EmptyArticlesView extends StatelessWidget {
  const _EmptyArticlesView({super.key});

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
