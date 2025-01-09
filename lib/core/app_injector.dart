import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:github_feed/core/config/network/dio_factory.dart';
import 'package:github_feed/features/feed/data/data_sources/feed_api_data_source.dart';
import 'package:github_feed/features/feed/data/data_sources/feed_local_data_source_impl.dart';
import 'package:github_feed/features/feed/data/repositories/feed_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.I;

class AppInjector {
  AppInjector._();

  static Future<void> init() async {
    locator.registerLazySingleton(() => const DioFactory().createDio());

    final sharedPref = await SharedPreferences.getInstance();
    locator.registerLazySingleton<SharedPreferences>(() => sharedPref);

    locator.registerLazySingleton(
      () => FeedLocalClientImpl(sharedPreferences: locator<SharedPreferences>()),
    );

    locator.registerLazySingleton(() => FeedApiDataSource(locator<Dio>()));

    locator.registerLazySingleton(
      () => FeedRepositoryImpl(
        localClient: locator<FeedLocalClientImpl>(),
        apiClient: locator<FeedApiDataSource>(),
        connectivity: Connectivity(), // already a singleton, no need to inject
      ),
    );
  }
}
