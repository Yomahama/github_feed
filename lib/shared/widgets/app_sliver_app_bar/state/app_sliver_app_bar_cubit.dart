import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_feed/core/mixins/calculations_handler.dart';
import 'package:github_feed/shared/widgets/app_sliver_app_bar/app_sliver_app_bar.dart';

part 'app_sliver_app_bar_cubit.freezed.dart';
part 'app_sliver_app_bar_state.dart';

class AppSliverAppBarCubit extends Cubit<AppSliverAppBarState> with CalculationHandler {
  AppSliverAppBarCubit() : super(AppSliverAppBarState());

  void onScroll(FlexibleSpaceBarSettings? settings) {
    final minExtent = settings?.minExtent ?? 0;
    final maxExtent = settings?.maxExtent ?? 0;
    final currentExtent = settings?.currentExtent ?? 0;

    final max = maxExtent - minExtent;
    final current = currentExtent - minExtent;

    final showLargeTitle = current > AppSliverAppBar.titleBotPadding;

    final dividerOpacity = showLargeTitle ? getPercent(current, max - AppSliverAppBar.titleBotPadding) : 1.0;

    emit(state.copyWith(showLargeTitle: showLargeTitle, dividerOpacity: dividerOpacity));
  }
}
