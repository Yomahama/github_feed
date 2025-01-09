import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_feed/core/app_injector.dart';
import 'package:github_feed/features/feed/data/models/link.dart';
import 'package:github_feed/features/feed/data/models/links.dart';
import 'package:github_feed/features/feed/data/repositories/feed_repository.dart';
import 'package:github_feed/features/feed/presentation/links_page/links_page.dart';
import 'package:github_feed/features/feed/presentation/links_page/widgets/link_tile.dart';
import 'package:github_feed/features/feed/presentation/links_page/widgets/links_list_view.dart';
import 'package:github_feed/features/feed/presentation/widgets/sliver_fill_remaining_loading.dart';
import 'package:github_feed/features/feed/state/feed_links/feed_links_cubit.dart';
import 'package:github_feed/main.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockFeedRepository extends Mock implements FeedRepository {}

void main() {
  group('MyApp Widget Test', () {
    late MockFeedRepository mockFeedRepository;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      await locator.reset();
      await AppInjector.init();

      mockFeedRepository = MockFeedRepository();
    });

    const links = Links(links: {
      'timeline': Link(href: 'https://github.com/timeline', type: 'application/atom+xml'),
      'user': Link(href: 'https://github.com/{user}', type: 'application/atom+xml'),
      'repository_discussions':
          Link(href: 'https://github.com/{user}/{repo}/discussions', type: 'application/atom+xml'),
      'repository_discussions_category': Link(
          href: 'https://github.com/{user}/{repo}/discussions/categories/{category}', type: 'application/atom+xml'),
      'security_advisories': Link(href: 'https://github.com/security-advisories', type: 'application/atom+xml'),
    });

    testWidgets('Displays loading indicator on app start', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.byType(SliverFillRemainingLoading), findsOneWidget);
    });

    testWidgets('Displays a list of feed links', (WidgetTester tester) async {
      when(() => mockFeedRepository.getFeedLinks()).thenAnswer((_) async => Future.value(links));

      await tester.pumpWidget(BlocProvider(
        create: (context) => FeedLinksCubit(feedRepository: mockFeedRepository)..get(),
        child: const MaterialApp(home: LinksPage()),
      ));

      await tester.pumpAndSettle();

      expect(find.byType(LinkTile), findsExactly(5));
      expect(find.text('Timeline'), findsOne);
      expect(find.text('User'), findsOne);
      expect(find.text('Repository Discussions'), findsOne);
      expect(find.text('Repository Discussions Category'), findsOne);
      expect(find.text('Security Advisories'), findsOne);
    });

    testWidgets('Displays error text when could not get data', (WidgetTester tester) async {
      when(() => mockFeedRepository.getFeedLinks()).thenThrow(Exception());

      await tester.pumpWidget(BlocProvider(
        create: (context) => FeedLinksCubit(feedRepository: mockFeedRepository)..get(),
        child: const MaterialApp(home: LinksPage()),
      ));

      await tester.pumpAndSettle();

      expect(find.byType(FailureLinksView), findsOne);
    });
  });
}
