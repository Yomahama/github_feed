import 'package:github_feed/features/feed/data/models/feed.dart';
import 'package:github_feed/features/feed/data/models/link.dart';
import 'package:github_feed/features/feed/data/models/links.dart';

abstract class FeedRepository {
  Future<Links> getFeedLinks();
  Future<Feed> getFeed(Link link);
}
