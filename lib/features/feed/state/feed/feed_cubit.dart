import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_feed/features/feed/data/models/feed.dart';
import 'package:github_feed/features/feed/data/models/link.dart';
import 'package:github_feed/features/feed/data/repositories/feed_repository.dart';

part 'feed_cubit.freezed.dart';
part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  final FeedRepository _feedRepository;
  Timer? _autoRefreshTimer;
  FeedCubit({
    required FeedRepository feedRepository,
  })  : _feedRepository = feedRepository,
        super(const FeedState.initial());

  static const _autoRefreshInterval = Duration(minutes: 1);

  Future<void> get(Link link) async {
    emit(FeedState.loading(feed: state.feed));
    try {
      final feed = await _feedRepository.getFeed(link);
      if (!isClosed) emit(FeedState.loaded(feed: feed));
    } catch (e, stackTrace) {
      if (!isClosed) {
        addError(e, stackTrace);
        emit(FeedState.failure(feed: state.feed));
      }
    }
  }

  void startAutoRefresh(Link link) {
    _autoRefreshTimer = Timer.periodic(_autoRefreshInterval, (_) => get(link));
  }

  @override
  Future<void> close() {
    _autoRefreshTimer?.cancel();
    return super.close();
  }
}
