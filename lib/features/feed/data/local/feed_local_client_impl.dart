import 'dart:convert';

import 'package:github_feed/features/feed/data/local/feed_local_client.dart';
import 'package:github_feed/features/feed/data/models/links.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedLocalClientImpl implements FeedLocalClient {
  final SharedPreferences _sharedPreferences;

  const FeedLocalClientImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  static const _key = 'feed_links';

  @override
  Future<bool> saveFeedLinks(Links links) async {
    final map = links.toJson();
    return _sharedPreferences.setString(_key, jsonEncode(map));
  }

  @override
  Links? getFeedLinks() {
    final jsonString = _sharedPreferences.getString(_key);
    if (jsonString == null) return null;

    return Links.fromJson(jsonDecode(jsonString));
  }
}
