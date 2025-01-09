// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedImpl _$$FeedImplFromJson(Map<String, dynamic> json) => _$FeedImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      updated: DateTime.parse(json['updated'] as String),
      articles: (json['entry'] as List<dynamic>?)
              ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$FeedImplToJson(_$FeedImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'updated': instance.updated.toIso8601String(),
      'entry': instance.articles,
    };
