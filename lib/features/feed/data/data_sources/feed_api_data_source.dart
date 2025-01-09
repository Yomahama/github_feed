import 'package:dio/dio.dart';
import 'package:github_feed/features/feed/data/models/feed.dart';
import 'package:github_feed/features/feed/data/models/links.dart';
import 'package:retrofit/retrofit.dart';

part 'feed_api_data_source.g.dart';

@RestApi()
abstract class FeedApiDataSource {
  factory FeedApiDataSource(Dio dio) = _FeedApiDataSource;

  @GET('https://api.github.com/feeds')
  Future<Links> getFeedLinks();

  @GET('{path}')
  Future<Feed> getFeed(
    @Header('Accept') String accept,
    @Path('path') String path,
  );
}
