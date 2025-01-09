// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_feed/features/feed/data/models/article.dart';

part 'feed.freezed.dart';
part 'feed.g.dart';

@freezed
class Feed with _$Feed {
  const factory Feed({
    required String id,
    required String title,
    required DateTime updated,
    @JsonSerializable(explicitToJson: true) @JsonKey(name: 'entry', defaultValue: []) required List<Article> articles,
  }) = _Feed;

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json['feed']);
}
