import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_feed/features/feed/data/models/link.dart';
import 'package:github_feed/features/feed/data/models/links.dart';
import 'package:github_feed/features/feed/data/repositories/feed_repository.dart';
import 'package:github_feed/features/feed/state/feed_links/feed_links_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockFeedRepository extends Mock implements FeedRepository {}

void main() {
  late MockFeedRepository mockFeedRepository;

  const link = Link(href: 'href', type: 'https://github.com/timeline');

  const links = Links(links: {'timeline': link});

  setUp(() {
    mockFeedRepository = MockFeedRepository();
  });

  group('FeedLinksCubit', () {
    blocTest(
      'Emits [] when FeedLinksCubit is initialized',
      build: () => FeedLinksCubit(feedRepository: mockFeedRepository),
      expect: () => [],
      verify: (_) {
        verifyNever(() => mockFeedRepository.getFeedLinks());
      },
    );

    blocTest(
      'Emits [FeedLinksState.loading, FeedLinksState.loaded] when get() is sucessfuly executed',
      build: () {
        when(() => mockFeedRepository.getFeedLinks()).thenAnswer((_) => Future.value(links));
        return FeedLinksCubit(feedRepository: mockFeedRepository);
      },
      act: (cubit) => cubit.get(),
      expect: () => [
        const FeedLinksState.loading(),
        const FeedLinksState.loaded(links: links),
      ],
      verify: (_) {
        verify(() => mockFeedRepository.getFeedLinks()).called(1);
      },
    );

    blocTest(
      'Emits [FeedLinksState.loading, FeedLinksState.failure] when get() fails',
      build: () {
        when(() => mockFeedRepository.getFeedLinks()).thenThrow(Exception());
        return FeedLinksCubit(feedRepository: mockFeedRepository);
      },
      act: (cubit) => cubit.get(),
      expect: () => [
        const FeedLinksState.loading(),
        const FeedLinksState.failure(),
      ],
      verify: (_) {
        verify(() => mockFeedRepository.getFeedLinks()).called(1);
      },
    );
  });
}
