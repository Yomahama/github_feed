part of 'app_sliver_app_bar_cubit.dart';

@freezed
class AppSliverAppBarState with _$AppSliverAppBarState {
  factory AppSliverAppBarState({
    @Default(true) bool showLargeTitle,
    @Default(0) double dividerOpacity,
  }) = _AppSliverAppBarState;
}
