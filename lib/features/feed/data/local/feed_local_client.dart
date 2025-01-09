import 'package:github_feed/features/feed/data/models/links.dart';

abstract class FeedLocalClient {
  Future<bool> saveFeedLinks(Links links);
  Links? getFeedLinks();
}
