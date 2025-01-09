import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_feed/features/feed/presentation/links_page/widgets/link_tile.dart';
import 'package:github_feed/features/feed/presentation/widgets/sliver_fill_remaining_loading.dart';
import 'package:github_feed/features/feed/state/feed_links/feed_links_cubit.dart';

class LinksListView extends StatelessWidget {
  const LinksListView({super.key});

  @override
  Widget build(BuildContext context) {
    final feedLinksState = context.watch<FeedLinksCubit>().state;

    return feedLinksState.maybeWhen(
      loaded: (links) => SliverList.separated(
        itemCount: links.values.length,
        itemBuilder: (_, i) => LinkTile(link: links.values[i]),
        separatorBuilder: (context, index) => const Divider(indent: 15),
      ),
      failure: () => const _LinksErrorView(),
      orElse: () => const SliverFillRemainingLoading(),
    );
  }
}

class _LinksErrorView extends StatelessWidget {
  const _LinksErrorView();

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

   // final links = Links(links: {
    //   'timeline': Link(href: 'https://github.com/timeline', type: 'application/atom+xml'),
    //   'user': Link(href: 'https://github.com/{user}', type: 'application/atom+xml'),
    //   'repository_discussions':
    //       Link(href: 'https://github.com/{user}/{repo}/discussions', type: 'application/atom+xml'),
    //   'repository_discussions_category': Link(
    //       href: 'https://github.com/{user}/{repo}/discussions/categories/{category}', type: 'application/atom+xml'),
    //   'security_advisories': Link(href: 'https://github.com/security-advisories', type: 'application/atom+xml'),
    // });

    // return SliverList.separated(
    //   itemCount: links.values.length,
    //   itemBuilder: (_, i) => LinkTile(link: links.values[i]),
    //   separatorBuilder: (context, index) => const Divider(indent: 15),
    // );