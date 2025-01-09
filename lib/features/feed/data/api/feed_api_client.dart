import 'package:dio/dio.dart';
import 'package:github_feed/features/feed/data/models/feed.dart';
import 'package:github_feed/features/feed/data/models/links.dart';
import 'package:retrofit/retrofit.dart';

part 'feed_api_client.g.dart';

@RestApi()
abstract class FeedApiClient {
  factory FeedApiClient(Dio dio) = _FeedApiClient;

  @GET('https://api.github.com/feeds')
  Future<Links> getFeedLinks();

  @GET('{path}')
  Future<Feed> getFeed(
    @Header('Accept') String accept,
    @Path('path') String path,
  );
}
