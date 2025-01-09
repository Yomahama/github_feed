import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_feed/core/app_injector.dart';
import 'package:github_feed/features/feed/data/models/link.dart';
import 'package:github_feed/features/feed/data/repositories/feed_repository_impl.dart';
import 'package:github_feed/features/feed/presentation/feed_page/feed_page.dart';
import 'package:github_feed/features/feed/presentation/links_page/links_page.dart';
import 'package:github_feed/features/feed/state/feed/feed_cubit.dart';
import 'package:github_feed/features/feed/state/feed_links/feed_links_cubit.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  const AppRouter._();

  static final _router = [
    GoRoute(
      path: LinksPage.route,
      builder: (context, state) => BlocProvider(
        create: (context) => FeedLinksCubit(feedRepository: locator<FeedRepositoryImpl>()),
        child: const LinksPage(),
      ),
      routes: [
        GoRoute(
          path: FeedPage.route,
          builder: (context, state) {
            final link = state.extra as Link;

            return BlocProvider(
              create: (context) => FeedCubit(feedRepository: locator<FeedRepositoryImpl>(), link: link),
              child: FeedPage(link: link),
            );
          },
        ),
      ],
    ),
  ];

  static GoRouter get router => GoRouter(routes: _router);
}
