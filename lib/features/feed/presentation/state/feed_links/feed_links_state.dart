part of 'feed_links_cubit.dart';

@freezed
class FeedLinksState with _$FeedLinksState {
  const factory FeedLinksState.initial() = _Initial;
  const factory FeedLinksState.loading() = _Loading;
  const factory FeedLinksState.loaded({required Links links}) = _Loaded;
  const factory FeedLinksState.failure() = _Failure;
}
