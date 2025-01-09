import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:xml2json/xml2json.dart';

class XmlToJsonInterceptor extends Interceptor {
  const XmlToJsonInterceptor();

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final contentType = response.headers[Headers.contentTypeHeader]?.join(' ');

    if (contentType != null && contentType.contains('application/atom+xml')) {
      final xml2json = Xml2Json();
      xml2json.parse(response.data.toString());
      final jsonString = xml2json.toOpenRally();
      final jsonObject = json.decode(jsonString);

      response.data = jsonObject;
    }

    super.onResponse(response, handler);
  }
}
