// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_feed/core/extensions/string_extensions.dart';
import 'package:github_feed/features/feed/data/models/link.dart';

part 'links.freezed.dart';
part 'links.g.dart';

@freezed
class Links with _$Links {
  const Links._();
  const factory Links({
    @JsonSerializable(explicitToJson: true) @JsonKey(name: '_links') required Map<String, Link> links,
  }) = _Links;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  List<Link> get values => links.entries.map((e) => e.value.copyWith(name: e.key.snakeToTitleCase)).toList();
}
