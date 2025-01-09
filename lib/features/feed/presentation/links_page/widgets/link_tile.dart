// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_feed/core/constants/theme/app_colors.dart';
import 'package:github_feed/core/constants/theme/text_styles.dart';
import 'package:github_feed/features/feed/data/models/link.dart';
import 'package:github_feed/features/feed/presentation/feed_page/feed_page.dart';
import 'package:github_feed/features/feed/presentation/links_page/widgets/link_text_field.dart';
import 'package:github_feed/features/feed/state/link_tile/link_tile_cubit.dart';
import 'package:github_feed/shared/animations/animated_color_tap.dart';
import 'package:go_router/go_router.dart';

class LinkTile extends StatelessWidget {
  final Link link;

  const LinkTile({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LinkTileCubit(link: link),
      child: _LinkTileView(link: link),
    );
  }
}

class _LinkTileView extends StatelessWidget {
  final Link link;

  const _LinkTileView({required this.link, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedColorTap(
      onTap: () => _onTap(context, link),
      child: Container(
        constraints: const BoxConstraints(minHeight: 60),
        padding: const EdgeInsets.only(left: 15, right: 10, top: 8, bottom: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    link.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  if (context.read<LinkTileCubit>().linkHasRequiredParams) ...[
                    const Text('Enter required params:', style: TextStyles.robotoMedium12Grey),
                    const SizedBox(height: 6),
                    DynamicLinkTextField(
                      link: link,
                      onParamChanged: context.read<LinkTileCubit>().onParamChanged,
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Icon(CupertinoIcons.chevron_right, color: AppColors.grey400, size: 20),
          ],
        ),
      ),
    );
  }

  void _onTap(BuildContext context, Link link) {
    final linkTileCubit = context.read<LinkTileCubit>();
    final linkTileState = linkTileCubit.state;

    if (!linkTileCubit.linkHasRequiredParams) {
      return context.go(FeedPage.route, extra: link);
    }

    if (linkTileState.someInputParamsAreEmpty) {
      return _showMissingParamsDialog(context);
    }

    context.go(FeedPage.route, extra: linkTileState.updatedLink);
  }

  void _showMissingParamsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const AlertDialog(
        title: Text('Missing Parameters'),
        content: Text('Please enter all required parameters'),
      ),
    );
  }
}
