import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_feed/core/extensions/context_extensions.dart';
import 'package:github_feed/core/extensions/datetime_extensions.dart';
import 'package:github_feed/features/feed/data/models/feed.dart';
import 'package:github_feed/features/feed/data/models/link.dart';
import 'package:github_feed/features/feed/presentation/feed_page/widgets/feed_articles_list_view.dart';
import 'package:github_feed/features/feed/state/feed/feed_cubit.dart';
import 'package:github_feed/shared/widgets/app_sliver_app_bar/app_sliver_app_bar.dart';

class FeedPage extends StatelessWidget {
  final Link link;
  const FeedPage({required this.link, super.key});

  static String get route => '/feed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppSliverAppBar(title: link.name),
          const _AboutSectionView(),
          const ArticlesListView(),
          SliverToBoxAdapter(child: SizedBox(height: context.bottomViewPadding)),
        ],
      ),
    );
  }
}

class _AboutSectionView extends StatelessWidget {
  const _AboutSectionView();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<FeedCubit, FeedState>(
              builder: (context, state) {
                final text = state.maybeWhen(
                  loaded: (feed) => _updateAtText(feed),
                  loading: (feed) => feed == null ? _loadingText : _updateAtText(feed),
                  failure: (feed) => feed == null ? 'Could not load info' : _updateAtText(feed),
                  orElse: () => _loadingText,
                );

                return Text(text, style: Theme.of(context).textTheme.labelSmall);
              },
            ),
            const SizedBox(height: 20),
            Text('Articles', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  String _updateAtText(Feed feed) => 'Updated at: ${feed.updated.yyyyMMddHHmm}';
  String get _loadingText => 'Loading...';
}
