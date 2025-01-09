// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:github_feed/core/constants/theme/app_colors.dart';
import 'package:github_feed/core/constants/theme/text_styles.dart';
import 'package:github_feed/core/extensions/list_extensions.dart';
import 'package:github_feed/features/feed/data/models/link.dart';

typedef OnParamChanged = void Function(String key, String value);

class DynamicLinkTextField extends StatelessWidget {
  final Link link;
  final OnParamChanged onParamChanged;

  const DynamicLinkTextField({super.key, required this.link, required this.onParamChanged});

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(link.href);
    final segments = [uri.host, ...uri.pathSegments];

    return Wrap(
      runSpacing: 2,
      children: segments
          .map<Widget>((text) {
            final match = Link.pathParamRegex.firstMatch(text)?.group(1);
            return match != null
                ? _ParamTextField(labelText: match, onParamChanged: onParamChanged)
                : _ParamText(text: text);
          })
          .toList()
          .addBetween(const _ParamText(text: '/')),
    );
  }
}

class _ParamText extends StatelessWidget {
  final String text;
  const _ParamText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 16), child: Text(text));
  }
}

class _ParamTextField extends StatelessWidget {
  final String labelText;
  final OnParamChanged onParamChanged;
  const _ParamTextField({required this.labelText, required this.onParamChanged, super.key});

  @override
  Widget build(BuildContext context) {
    const defaultBorder = OutlineInputBorder(borderSide: BorderSide(color: AppColors.grey400));

    return IntrinsicWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(labelText, style: TextStyles.robotoSemiBold12Black),
            Container(
              constraints: const BoxConstraints(minWidth: 50),
              child: TextField(
                onChanged: (value) => onParamChanged(labelText, value),
                textInputAction: TextInputAction.done,
                expands: false,
                maxLines: null,
                minLines: null,
                style: const TextStyle(fontSize: 14),
                cursorHeight: 12,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 3),
                  isDense: true,
                  border: defaultBorder,
                  enabledBorder: defaultBorder,
                  focusedBorder: defaultBorder,
                  disabledBorder: defaultBorder,
                  focusedErrorBorder: defaultBorder,
                  fillColor: AppColors.grey100,
                  filled: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
