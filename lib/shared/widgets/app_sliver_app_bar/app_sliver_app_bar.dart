// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_feed/core/constants/animation_durations.dart';
import 'package:github_feed/core/constants/theme/text_styles.dart';
import 'package:github_feed/core/extensions/context_extensions.dart';
import 'package:github_feed/core/extensions/text_widget_extensions.dart';
import 'package:github_feed/shared/widgets/app_back_button.dart';
import 'package:github_feed/shared/widgets/app_sliver_app_bar/state/app_sliver_app_bar_cubit.dart';

class AppSliverAppBar extends StatelessWidget {
  final String title;
  final bool showBackButton;
  const AppSliverAppBar({super.key, required this.title, this.showBackButton = true});

  static const titleBotPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppSliverAppBarCubit(),
      child: _AppSliverAppBarView(
        title: title,
        showBackButton: showBackButton,
      ),
    );
  }
}

class _AppSliverAppBarView extends StatefulWidget {
  final String title;
  final bool showBackButton;

  const _AppSliverAppBarView({required this.title, required this.showBackButton, super.key});

  @override
  State<_AppSliverAppBarView> createState() => _AppSliverAppBarViewState();
}

class _AppSliverAppBarViewState extends State<_AppSliverAppBarView> {
  late final Text _largeTitle;

  Size _largeTitleSize = const Size.fromHeight(AppSliverAppBar.titleBotPadding);

  @override
  void initState() {
    super.initState();

    _largeTitle = Text(widget.title, style: TextStyles.robotoSemiBold24Black);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      const hPadding = 15.0;
      final width = context.screenWidth - hPadding * 2;
      setState(() => _largeTitleSize = _largeTitle.getSize(width: width, context: context));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: _largeTitleSize.height + 4 + kToolbarHeight + AppSliverAppBar.titleBotPadding,
      leading: widget.showBackButton ? const AppBackButton() : null,
      stretch: true,
      pinned: true,
      centerTitle: true,
      title: _AppBarTitle(title: widget.title),
      flexibleSpace: Builder(
        builder: (context) {
          final settings = context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
          context.read<AppSliverAppBarCubit>().onScroll(settings);

          return Stack(
            children: [
              Positioned(
                bottom: AppSliverAppBar.titleBotPadding,
                left: 15,
                right: 15,
                child: _largeTitle,
              ),
              const _SliverAppBarForeground(),
              const _SliverAppBarDivider(),
            ],
          );
        },
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  final String title;

  const _AppBarTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    final showLargeTitle = context.select((AppSliverAppBarCubit cubit) => cubit.state.showLargeTitle);

    return AnimatedOpacity(
      duration: Animations.duration200,
      opacity: showLargeTitle ? 0 : 1,
      child: Text(title, style: TextStyles.robotoSemiBold16Black),
    );
  }
}

class _SliverAppBarForeground extends StatelessWidget {
  const _SliverAppBarForeground();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: kToolbarHeight + context.viewPadding.top,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}

class _SliverAppBarDivider extends StatelessWidget {
  const _SliverAppBarDivider();

  @override
  Widget build(BuildContext context) {
    final opacity = context.select((AppSliverAppBarCubit cubit) => cubit.state.dividerOpacity);

    return Positioned(
      top: kToolbarHeight + context.viewPadding.top - 1,
      left: 0,
      right: 0,
      child: Opacity(opacity: opacity, child: const Divider()),
    );
  }
}
