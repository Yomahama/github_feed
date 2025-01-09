import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:github_feed/features/feed/data/api/feed_api_client.dart';
import 'package:github_feed/features/feed/data/local/feed_local_client.dart';
import 'package:github_feed/features/feed/data/models/feed.dart';
import 'package:github_feed/features/feed/data/models/link.dart';
import 'package:github_feed/features/feed/data/models/links.dart';
import 'package:github_feed/features/feed/data/repositories/feed_repository.dart';

class FeedRepositoryImpl implements FeedRepository {
  final FeedLocalClient _localClient;
  final FeedApiClient _apiClient;
  final Connectivity _connectivity;

  const FeedRepositoryImpl({
    required FeedLocalClient localClient,
    required FeedApiClient apiClient,
    required Connectivity connectivity,
  })  : _localClient = localClient,
        _apiClient = apiClient,
        _connectivity = connectivity;

  @override
  Future<Links> getFeedLinks() async {
    final connectivityResult = await _connectivity.checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      final links = _localClient.getFeedLinks();

      if (links == null) {
        throw Exception('No internet connection and no cached data');
      }

      return links;
    }

    final links = await _apiClient.getFeedLinks();
    await _localClient.saveFeedLinks(links);
    return links;
  }

  @override
  Future<Feed> getFeed(Link link) => _apiClient.getFeed(link.type, link.href);
}
