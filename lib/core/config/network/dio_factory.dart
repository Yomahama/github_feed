import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:github_feed/core/config/network/interceptors/custom_dio_logger.dart';
import 'package:github_feed/core/config/network/interceptors/xml_to_json_interceptor.dart';

class DioFactory {
  const DioFactory();

  Dio createDio() {
    return Dio()
      ..options = BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        headers: {
          Headers.contentTypeHeader: 'application/json',
        },
      )
      ..interceptors.addAll([
        const XmlToJsonInterceptor(),
        if (!kReleaseMode) const CustomDioLogger(),
      ]);
  }
}
