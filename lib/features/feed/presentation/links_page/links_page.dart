import 'package:flutter/material.dart';
import 'package:github_feed/core/extensions/context_extensions.dart';
import 'package:github_feed/features/feed/presentation/links_page/widgets/links_list_view.dart';
import 'package:github_feed/shared/widgets/app_sliver_app_bar/app_sliver_app_bar.dart';

class LinksPage extends StatelessWidget {
  const LinksPage({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          const AppSliverAppBar(title: 'GitHub Feed', showBackButton: false),
          const LinksListView(),
          SliverToBoxAdapter(child: SizedBox(height: context.bottomViewPadding)),
        ],
      ),
    );
  }
}
