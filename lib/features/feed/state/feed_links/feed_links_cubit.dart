import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_feed/features/feed/data/models/links.dart';
import 'package:github_feed/features/feed/data/repositories/feed_repository.dart';

part 'feed_links_cubit.freezed.dart';
part 'feed_links_state.dart';

class FeedLinksCubit extends Cubit<FeedLinksState> {
  final FeedRepository _feedRepository;
  FeedLinksCubit({
    required FeedRepository feedRepository,
  })  : _feedRepository = feedRepository,
        super(const FeedLinksState.initial()) {
    _get();
  }

  Future<void> _get() async {
    emit(const FeedLinksState.loading());
    try {
      final links = await _feedRepository.getFeedLinks();
      emit(FeedLinksState.loaded(links: links));
    } catch (e, stackTrace) {
      addError(e, stackTrace);
      emit(const FeedLinksState.failure());
    }
  }
}
