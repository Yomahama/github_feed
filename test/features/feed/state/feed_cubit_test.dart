import 'package:bloc_test/bloc_test.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_feed/features/feed/data/models/feed.dart';
import 'package:github_feed/features/feed/data/models/link.dart';
import 'package:github_feed/features/feed/domain/repositories/feed_repository.dart';
import 'package:github_feed/features/feed/presentation/state/feed/feed_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockFeedRepository extends Mock implements FeedRepository {}

void main() {
  late MockFeedRepository mockFeedRepository;

  const link = Link(href: 'https://github.com/timeline', type: '');
  final feed = Feed(id: '', title: 'title', updated: DateTime(2025), articles: []);

  setUp(() {
    mockFeedRepository = MockFeedRepository();
  });

  group(
    'FeedCubit',
    () {
      blocTest(
        'Emits [] when FeedCubit is initialized',
        build: () => FeedCubit(feedRepository: mockFeedRepository),
        expect: () => [],
        verify: (_) {
          verifyNever(() => mockFeedRepository.getFeed(link));
        },
      );

      blocTest(
        'Emits [FeedState.loading, FeedState.loaded] when get() is sucessfuly executed',
        build: () {
          when(() => mockFeedRepository.getFeed(link)).thenAnswer((_) => Future.value(feed));
          return FeedCubit(feedRepository: mockFeedRepository);
        },
        act: (cubit) => cubit.get(link),
        expect: () => [
          const FeedState.loading(),
          FeedState.loaded(feed: feed),
        ],
        verify: (_) {
          verify(() => mockFeedRepository.getFeed(link)).called(1);
        },
      );

      blocTest(
        'Emits [FeedState.loading, FeedState.failure] when get() fails',
        build: () {
          when(() => mockFeedRepository.getFeed(link)).thenThrow(Exception());
          return FeedCubit(feedRepository: mockFeedRepository);
        },
        act: (cubit) => cubit.get(link),
        expect: () => [
          const FeedState.loading(),
          const FeedState.failure(),
        ],
        verify: (_) {
          verify(() => mockFeedRepository.getFeed(link)).called(1);
        },
      );

      blocTest(
        'emits [FeedState.loading, FeedState.loaded] periodically when auto-refresh is active',
        build: () {
          when(() => mockFeedRepository.getFeed(link)).thenAnswer((_) async => feed);
          return FeedCubit(feedRepository: mockFeedRepository);
        },
        act: (cubit) {
          fakeAsync((async) {
            cubit.startAutoRefresh(link);
            async.elapse(const Duration(minutes: 3));
            async.flushMicrotasks();
          });
        },
        expect: () => [
          const FeedState.loading(feed: null),
          FeedState.loaded(feed: feed),
          FeedState.loading(feed: feed),
          FeedState.loaded(feed: feed),
          FeedState.loading(feed: feed),
          FeedState.loaded(feed: feed),
        ],
        verify: (_) {
          verify(() => mockFeedRepository.getFeed(link)).called(3);
        },
      );

      blocTest(
        'emits [FeedState.loading, FeedState.failure] periodically until FeedCubit is closed',
        build: () {
          when(() => mockFeedRepository.getFeed(link)).thenAnswer((_) async => feed);
          return FeedCubit(feedRepository: mockFeedRepository);
        },
        act: (cubit) {
          fakeAsync((async) {
            cubit.startAutoRefresh(link);
            async.elapse(const Duration(seconds: 60 + 30));
            async.flushMicrotasks();
          });
          cubit.close();
        },
        expect: () => [
          const FeedState.loading(),
          FeedState.loaded(feed: feed),
        ],
        verify: (cubit) {
          verify(() => mockFeedRepository.getFeed(link)).called(1);
        },
      );
    },
  );
}
