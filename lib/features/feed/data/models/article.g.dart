// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      id: json['id'] as String,
      published: DateTime.parse(json['published'] as String),
      updated: DateTime.parse(json['updated'] as String),
      title: json['title'] as String,
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'published': instance.published.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
      'title': instance.title,
    };
