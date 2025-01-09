part of 'feed_cubit.dart';

@freezed
class FeedState with _$FeedState {
  const factory FeedState.initial({Feed? feed}) = _Initial;
  const factory FeedState.loading({Feed? feed}) = _Loading;
  const factory FeedState.loaded({required Feed feed}) = _Loaded;
  const factory FeedState.failure({Feed? feed}) = _Failure;
}
